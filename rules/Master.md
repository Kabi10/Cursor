# Master Rule File for Category Management

## ⚠️ MANDATORY PRE-IMPLEMENTATION CHECKLIST ⚠️
STOP! Before writing ANY code or suggesting ANY changes:

1. 🔍 SEARCH FIRST (REQUIRED):
   ```bash
   # Document ALL search results below
   grep_search "category" # Search for related functionality
   file_search "*category*" # Search for similar files
   list_dir "app/(routes)" # List contents of relevant directories
   list_dir "components" # List related components
   list_dir "lib" # Check for data fetching functions
   ```

2. 📝 DOCUMENT FINDINGS (REQUIRED):
   ```markdown
   ## Existing Files Found:
   - [List all relevant category files with full paths]
   - [Include file sizes and last modified dates if relevant]
   
   ## Existing Functionality:
   - [Describe what category operations already exist]
   - [Note any patterns or architectural approaches used]
   
   ## Gaps Identified:
   - [List what category features are missing or need enhancement]
   - [Identify technical debt or issues in existing category code]
   
   ## Implementation Decision Tree:
   - Is there existing category management code? [Yes/No]
   - Can existing code be enhanced to meet requirements? [Yes/No]
   - Is creating new code justified? [Yes/No, with reasoning]
   
   ## Proposed Approach:
   - [ ] Enhance existing category code at [file path]
   - [ ] Create new files (requires detailed justification)
   - [ ] Refactor existing category code at [file path]
   
   ## Implementation Plan:
   1. [First step with estimated effort]
   2. [Second step with estimated effort]
   3. [Additional steps as needed]
   ```

3. ✋ WAIT FOR APPROVAL:
   - Present findings to user with clear options
   - Get explicit approval for chosen approach
   - Never proceed with new files if similar functionality exists
   - Document approval in the implementation plan

❌ IF YOU SKIP THIS CHECKLIST, YOU ARE VIOLATING THE MOST IMPORTANT RULE ❌

## 📋 Category Management Requirements

### Category Data Model
- Each category must have:
  - Unique identifier (id)
  - Name (required, unique)
  - Description (optional)
  - Slug (auto-generated from name, URL-friendly)
  - Parent category reference (optional, for hierarchical categories)
  - Created/Updated timestamps
  - Active status flag
  - Display order (for sorting)
  - Image (optional)

### Category Operations
1. **Create Category**
   - Validate unique name
   - Generate slug
   - Assign to parent category if applicable
   - Set default active status
   - Assign display order

2. **Read Categories**
   - List all categories
   - Filter by parent/active status
   - Search by name/description
   - Sort by name/display order
   - Pagination support
   - Hierarchical tree view option

3. **Update Category**
   - Modify name/description/image
   - Update slug if name changes
   - Change parent category
   - Adjust display order
   - Toggle active status

4. **Delete Category**
   - Soft delete with status flag
   - Hard delete option
   - Handle child categories
   - Update associated products

### UI Components
1. **Category Management Page**
   - List view with sorting/filtering
   - Create/edit forms
   - Delete confirmation
   - Bulk operations

2. **Category Selection Components**
   - Dropdown selector
   - Checkbox tree
   - Radio button list
   - Multi-select interface

3. **Category Display Components**
   - Category card
   - Category breadcrumb
   - Category tree navigation
   - Category tag/pill

## 🛠️ Implementation Guidelines

### Data Layer
```tsx
// In prisma/schema.prisma
model Category {
  id          String    @id @default(cuid())
  name        String    @unique
  description String?
  slug        String    @unique
  parentId    String?
  parent      Category? @relation("CategoryToSubcategory", fields: [parentId], references: [id])
  children    Category[] @relation("CategoryToSubcategory")
  isActive    Boolean   @default(true)
  displayOrder Int       @default(0)
  imageUrl    String?
  createdAt   DateTime  @default(now())
  updatedAt   DateTime  @updatedAt
  products    Product[]
}
```

### API Layer Pattern
```tsx
// In app/api/categories/route.ts
import { NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { db } from '@/lib/db';
import { categorySchema } from '@/lib/validations/category';

export async function GET(req: Request) {
  try {
    const { searchParams } = new URL(req.url);
    const parentId = searchParams.get('parentId');
    const isActive = searchParams.get('isActive') === 'true';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '10');
    const skip = (page - 1) * limit;

    const categories = await db.category.findMany({
      where: {
        ...(parentId ? { parentId } : {}),
        ...(searchParams.has('isActive') ? { isActive } : {})
      },
      orderBy: { displayOrder: 'asc' },
      skip,
      take: limit,
      include: { 
        parent: true,
        _count: { select: { children: true, products: true } }
      }
    });
    
    const total = await db.category.count({
      where: {
        ...(parentId ? { parentId } : {}),
        ...(searchParams.has('isActive') ? { isActive } : {})
      }
    });

    return NextResponse.json({ 
      categories, 
      pagination: { page, limit, total, pages: Math.ceil(total / limit) } 
    });
  } catch (error) {
    console.error('[CATEGORIES_GET]', error);
    return new NextResponse('Internal error', { status: 500 });
  }
}

export async function POST(req: Request) {
  try {
    const session = await auth();
    
    if (!session?.user || session.user.role !== 'ADMIN') {
      return new NextResponse('Unauthorized', { status: 403 });
    }
    
    const body = await req.json();
    const validatedData = categorySchema.parse(body);
    
    // Generate slug from name
    const slug = validatedData.name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '');
    
    // Check for duplicate slug
    const existingCategory = await db.category.findUnique({
      where: { slug }
    });
    
    if (existingCategory) {
      return new NextResponse('Category with this name already exists', { status: 400 });
    }
    
    const category = await db.category.create({
      data: {
        ...validatedData,
        slug
      }
    });
    
    return NextResponse.json(category);
  } catch (error) {
    console.error('[CATEGORIES_POST]', error);
    return new NextResponse('Internal error', { status: 500 });
  }
}
```

### Server Component Pattern
```tsx
// In app/(routes)/admin/categories/page.tsx
import { Suspense } from 'react';
import { CategoryList } from '@/components/category/category-list';
import { CategoryListSkeleton } from '@/components/category/category-list-skeleton';
import { CategoryFilters } from '@/components/category/category-filters';
import { getCategories } from '@/lib/api/categories';
import { auth } from '@/lib/auth';
import { redirect } from 'next/navigation';

export const metadata = {
  title: 'Category Management',
  description: 'Manage product categories for your store'
};

export default async function CategoriesPage({
  searchParams
}: {
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  const session = await auth();
  
  if (!session?.user || session.user.role !== 'ADMIN') {
    redirect('/auth/login');
  }
  
  const categories = await getCategories(searchParams);
  
  return (
    <div className="p-6">
      <div className="flex items-center justify-between mb-8">
        <h1 className="text-2xl font-bold">Categories</h1>
        <CategoryFilters />
      </div>
      
      <Suspense fallback={<CategoryListSkeleton />}>
        <CategoryList 
          initialCategories={categories} 
          searchParams={searchParams} 
        />
      </Suspense>
    </div>
  );
}
```

### Client Component Pattern
```tsx
// In components/category/category-form.tsx
'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { zodResolver } from '@hookform/resolvers/zod';
import { useForm } from 'react-hook-form';
import { toast } from 'sonner';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Textarea } from '@/components/ui/textarea';
import { Switch } from '@/components/ui/switch';
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from '@/components/ui/form';
import { categorySchema } from '@/lib/validations/category';
import { CategorySelector } from '@/components/category/category-selector';
import { ImageUpload } from '@/components/ui/image-upload';
import type { Category } from '@prisma/client';

type CategoryFormProps = {
  initialData?: Category | null;
};

export function CategoryForm({ initialData }: CategoryFormProps) {
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);
  
  const form = useForm({
    resolver: zodResolver(categorySchema),
    defaultValues: initialData || {
      name: '',
      description: '',
      parentId: undefined,
      isActive: true,
      displayOrder: 0,
      imageUrl: ''
    }
  });
  
  async function onSubmit(values: z.infer<typeof categorySchema>) {
    try {
      setIsLoading(true);
      
      const url = initialData 
        ? `/api/categories/${initialData.id}` 
        : '/api/categories';
      
      const method = initialData ? 'PATCH' : 'POST';
      
      const response = await fetch(url, {
        method,
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(values)
      });
      
      if (!response.ok) {
        throw new Error(await response.text());
      }
      
      router.push('/admin/categories');
      router.refresh();
      
      toast.success(initialData 
        ? 'Category updated successfully' 
        : 'Category created successfully'
      );
    } catch (error) {
      console.error(error);
      toast.error('Something went wrong');
    } finally {
      setIsLoading(false);
    }
  }
  
  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="name"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Name</FormLabel>
              <FormControl>
                <Input 
                  disabled={isLoading} 
                  placeholder="Category name" 
                  {...field} 
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        
        <FormField
          control={form.control}
          name="description"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Description</FormLabel>
              <FormControl>
                <Textarea 
                  disabled={isLoading} 
                  placeholder="Category description" 
                  {...field} 
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        
        <FormField
          control={form.control}
          name="parentId"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Parent Category</FormLabel>
              <FormControl>
                <CategorySelector 
                  disabled={isLoading} 
                  value={field.value}
                  onChange={field.onChange}
                  excludeId={initialData?.id}
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        
        <div className="flex flex-col gap-6 sm:flex-row">
          <FormField
            control={form.control}
            name="displayOrder"
            render={({ field }) => (
              <FormItem className="flex-1">
                <FormLabel>Display Order</FormLabel>
                <FormControl>
                  <Input 
                    type="number" 
                    disabled={isLoading} 
                    {...field} 
                    onChange={(e) => field.onChange(parseInt(e.target.value))}
                  />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />
          
          <FormField
            control={form.control}
            name="isActive"
            render={({ field }) => (
              <FormItem className="flex flex-row items-center justify-between space-x-3 space-y-0 rounded-md border p-4">
                <div className="space-y-1">
                  <FormLabel>Active</FormLabel>
                  <p className="text-sm text-muted-foreground">
                    This category will be visible on the store
                  </p>
                </div>
                <FormControl>
                  <Switch
                    checked={field.value}
                    onCheckedChange={field.onChange}
                    disabled={isLoading}
                  />
                </FormControl>
              </FormItem>
            )}
          />
        </div>
        
        <FormField
          control={form.control}
          name="imageUrl"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Image</FormLabel>
              <FormControl>
                <ImageUpload
                  value={field.value ? [field.value] : []}
                  disabled={isLoading}
                  onChange={(url) => field.onChange(url)}
                  onRemove={() => field.onChange('')}
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        
        <div className="flex items-center justify-end space-x-4">
          <Button
            variant="outline"
            onClick={() => router.back()}
            disabled={isLoading}
            type="button"
          >
            Cancel
          </Button>
          <Button 
            disabled={isLoading} 
            type="submit"
          >
            {initialData ? 'Update Category' : 'Create Category'}
          </Button>
        </div>
      </form>
    </Form>
  );
}
```

## 🧪 Testing Requirements

### Unit Tests
```tsx
// In __tests__/components/category/category-form.test.tsx
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { CategoryForm } from '@/components/category/category-form';
import { toast } from 'sonner';

// Mock dependencies
jest.mock('next/navigation', () => ({
  useRouter: jest.fn(() => ({
    push: jest.fn(),
    refresh: jest.fn(),
    back: jest.fn()
  }))
}));

jest.mock('sonner', () => ({
  toast: {
    success: jest.fn(),
    error: jest.fn()
  }
}));

// Mock fetch
global.fetch = jest.fn();

describe('CategoryForm', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });
  
  it('renders correctly with default values', () => {
    render(<CategoryForm />);
    
    expect(screen.getByLabelText(/name/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/description/i)).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /create category/i })).toBeInTheDocument();
  });
  
  it('renders correctly with initial data', () => {
    const mockCategory = {
      id: '1',
      name: 'Test Category',
      description: 'Test Description',
      slug: 'test-category',
      parentId: null,
      isActive: true,
      displayOrder: 0,
      imageUrl: '',
      createdAt: new Date(),
      updatedAt: new Date()
    };
    
    render(<CategoryForm initialData={mockCategory} />);
    
    expect(screen.getByDisplayValue('Test Category')).toBeInTheDocument();
    expect(screen.getByDisplayValue('Test Description')).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /update category/i })).toBeInTheDocument();
  });
  
  it('validates required fields', async () => {
    render(<CategoryForm />);
    
    const submitButton = screen.getByRole('button', { name: /create category/i });
    fireEvent.click(submitButton);
    
    await waitFor(() => {
      expect(screen.getByText(/name is required/i)).toBeInTheDocument();
    });
  });
  
  it('submits the form with valid data', async () => {
    const mockFetch = global.fetch as jest.Mock;
    mockFetch.mockResolvedValueOnce({
      ok: true,
      json: async () => ({ id: '1', name: 'Test Category' })
    });
    
    render(<CategoryForm />);
    
    await userEvent.type(screen.getByLabelText(/name/i), 'Test Category');
    await userEvent.type(screen.getByLabelText(/description/i), 'Test Description');
    
    const submitButton = screen.getByRole('button', { name: /create category/i });
    await userEvent.click(submitButton);
    
    await waitFor(() => {
      expect(mockFetch).toHaveBeenCalledWith('/api/categories', expect.any(Object));
      expect(toast.success).toHaveBeenCalledWith('Category created successfully');
    });
  });
  
  it('handles API errors', async () => {
    const mockFetch = global.fetch as jest.Mock;
    mockFetch.mockResolvedValueOnce({
      ok: false,
      text: async () => 'Category with this name already exists'
    });
    
    render(<CategoryForm />);
    
    await userEvent.type(screen.getByLabelText(/name/i), 'Test Category');
    
    const submitButton = screen.getByRole('button', { name: /create category/i });
    await userEvent.click(submitButton);
    
    await waitFor(() => {
      expect(toast.error).toHaveBeenCalledWith('Something went wrong');
    });
  });
});
```

## 🔑 Best Practices

### Performance Considerations
1. **Efficient Queries**
   - Use database indexes on `name`, `slug`, and `parentId`
   - Implement selective loading with `include` for related data
   - Use pagination for large category lists

2. **Caching Strategy**
   - Cache category tree for navigation
   - Invalidate cache on category updates
   - Use ISR for category pages with 1-hour revalidation

3. **UI Optimizations**
   - Virtualize large category lists
   - Lazy-load category images
   - Implement skeleton loading states

### Security Guidelines
1. **Input Validation**
   - Validate all inputs with Zod schemas
   - Sanitize inputs to prevent XSS
   - Implement CSRF protection

2. **Access Control**
   - Enforce role-based access for category management
   - Log all category modifications
   - Implement rate limiting for API routes

### Error Handling
1. **Graceful Degradation**
   - Show fallback UI on fetch errors
   - Provide user-friendly error messages
   - Implement retry mechanisms for transient failures

2. **Logging Strategy**
   - Log category validation errors
   - Track category-related exceptions
   - Monitor category usage patterns

## 📈 Monitoring & Metrics

### Key Performance Indicators
1. **Usage Metrics**
   - Number of categories created
   - Category tree depth
   - Products per category ratio
   - Most/least used categories

2. **Performance Metrics**
   - Category page load time
   - Category API response time
   - Category form submission time

### Observability
1. **Logging**
   - Log category creation/update/delete events
   - Track category access patterns
   - Monitor category-related errors

2. **Alerts**
   - Alert on category tree depth exceeding 5 levels
   - Alert on orphaned categories (no products)
   - Alert on duplicate category names/slugs

## 🛠️ Troubleshooting Guide

### Common Issues
1. **Duplicate Slugs**
   - Check for case-insensitive duplicates
   - Implement slug uniqueness validation
   - Add numeric suffix to duplicate slugs

2. **Category Tree Cycles**
   - Validate that parent-child relationships don't create cycles
   - Implement max depth constraint (recommended: 5 levels)
   - Visual indicator for deep category nesting

3. **Orphaned Categories**
   - Regular audit of unused categories
   - Automatic detection of categories with no products
   - Clean-up recommendations for admin users

## 📚 Documentation Requirements

### API Documentation
```markdown
## Category API

### GET /api/categories
Retrieves a list of categories with optional filtering and pagination.

**Query Parameters:**
- `parentId` (optional): Filter by parent category ID
- `isActive` (optional): Filter by active status (true/false)
- `page` (optional): Page number for pagination (default: 1)
- `limit` (optional): Items per page (default: 10)
- `search` (optional): Search by name or description

**Response:**
```json
{
  "categories": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "slug": "string",
      "parentId": "string|null",
      "isActive": boolean,
      "displayOrder": number,
      "imageUrl": "string|null",
      "createdAt": "datetime",
      "updatedAt": "datetime",
      "_count": {
        "children": number,
        "products": number
      }
    }
  ],
  "pagination": {
    "page": number,
    "limit": number,
    "total": number,
    "pages": number
  }
}
```

### POST /api/categories
Creates a new category. Requires admin authentication.

**Request Body:**
```json
{
  "name": "string", // required
  "description": "string", // optional
  "parentId": "string", // optional
  "isActive": boolean, // optional, default: true
  "displayOrder": number, // optional, default: 0
  "imageUrl": "string" // optional
}
```

**Response:**
```json
{
  "id": "string",
  "name": "string",
  "description": "string",
  "slug": "string",
  "parentId": "string|null",
  "isActive": boolean,
  "displayOrder": number,
  "imageUrl": "string|null",
  "createdAt": "datetime",
  "updatedAt": "datetime"
}
```
```