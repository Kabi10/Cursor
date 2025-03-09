# Cursor Master Rules for Web Project Builders

## 🔄 Project Type Selection
Choose your project type from the list below to generate specific guidelines:

- [ ] E-commerce Website
- [ ] Business Website
- [ ] Portfolio Website
- [ ] Blog Website
- [ ] News & Media Website
- [ ] Social Media/Community Website
- [ ] Educational Website
- [ ] Entertainment/Streaming Website
- [ ] Landing Page
- [ ] Web Application/SaaS Platform

## ⚠️ MANDATORY PRE-IMPLEMENTATION CHECKLIST ⚠️
STOP! Before writing ANY code or suggesting ANY changes:

1. 🔍 SEARCH FIRST (REQUIRED):
   ```bash
   # Document ALL search results below
   grep_search "[feature keyword]" # Search for related functionality
   file_search "[filename pattern]" # Search for similar files
   list_dir "[relevant directory]" # List contents of relevant directories
   ```

2. 📝 DOCUMENT FINDINGS (REQUIRED):
   ```markdown
   ## Existing Files Found:
   - [List all relevant files found with full paths]
   - [Include file sizes and last modified dates if relevant]
   
   ## Existing Functionality:
   - [Describe what already exists in detail]
   - [Note any patterns or architectural approaches used]
   
   ## Gaps Identified:
   - [List what's missing or needs enhancement]
   - [Identify technical debt or issues in existing code]
   
   ## Implementation Decision Tree:
   - Is there existing code that serves this purpose? [Yes/No]
   - Can existing code be enhanced to meet requirements? [Yes/No]
   - Is creating new code justified? [Yes/No, with reasoning]
   
   ## Proposed Approach:
   - [ ] Enhance existing code at [file path]
   - [ ] Create new files (requires detailed justification)
   - [ ] Refactor existing code at [file path]
   
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

## 📚 Project Type Specific Rules

### Blog Website Architecture
```
┌─ Blog Specific Concerns ───────────────────────────────────────────┐
│                                                                    │
│  ┌─ Content Management ┐  ┌─ Reader Engagement ─┐  ┌─ Monetization ┐ │
│  │ - Post Creation     │  │ - Comments System   │  │ - Ads         │ │
│  │ - Categories/Tags   │  │ - Newsletter        │  │ - Memberships │ │
│  │ - Media Library     │  │ - Social Sharing    │  │ - Affiliates  │ │
│  └─────────────────────┘  └────────────────────┘  └────────────────┘ │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

### Blog Implementation Plan
1. Initial Setup (0% Complete)
   - [ ] Next.js with TypeScript setup
   - [ ] ESLint and Prettier configuration
   - [ ] Project structure setup
   - [ ] Git repository initialization

2. Core Features (0% Complete)
   - [ ] Content management system
   - [ ] Post creation and editing
   - [ ] Category and tag system
   - [ ] Media handling

3. User Engagement (0% Complete)
   - [ ] Comments system
   - [ ] Newsletter integration
   - [ ] Social sharing
   - [ ] User profiles

4. Monetization (0% Complete)
   - [ ] Ad integration
   - [ ] Membership system
   - [ ] Affiliate program
   - [ ] Payment processing

### News & Media Website Architecture
```
┌─ News & Media Specific Concerns ─────────────────────────────────────┐
│                                                                      │
│  ┌─ Editorial Management ┐  ┌─ Reader Engagement ─┐  ┌─ Monetization ┐ │
│  │ - Breaking News       │  │ - Comments System   │  │ - Subscriptions│ │
│  │ - Topic Organization  │  │ - Newsletter        │  │ - Advertising  │ │
│  │ - Multimedia Content  │  │ - Social Sharing    │  │ - Premium      │ │
│  │ - Fact Checking       │  │ - User Accounts     │  │   Content      │ │
│  └─────────────────────┘  └────────────────────┘  └──────────────────┘ │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

### Social Media/Community Website Architecture
```
┌─ Social Media Specific Concerns ─────────────────────────────────────┐
│                                                                      │
│  ┌─ User Interactions ─┐  ┌─ Content Management ┐  ┌─ Community ───┐ │
│  │ - Likes/Reactions   │  │ - Post Creation     │  │ - Groups      │ │
│  │ - Comments          │  │ - Media Uploads     │  │ - Moderation  │ │
│  │ - Sharing           │  │ - Content Discovery │  │ - Reporting   │ │
│  │ - Following         │  │ - Feed Algorithms   │  │ - Governance  │ │
│  └────────────────────┘  └────────────────────┘  └────────────────┘ │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

### Educational Website Architecture
```
┌─ Educational Specific Concerns ─────────────────────────────────────┐
│                                                                     │
│  ┌─ Learning Path ─────┐  ┌─ Assessment ─────┐  ┌─ Community ────┐ │
│  │ - Course Structure  │  │ - Quizzes        │  │ - Forums       │ │
│  │ - Progress Tracking │  │ - Assignments    │  │ - Study Groups │ │
│  │ - Prerequisites     │  │ - Certifications │  │ - Peer Review  │ │
│  │ - Learning Outcomes │  │ - Grading        │  │ - Mentorship   │ │
│  └────────────────────┘  └─────────────────┘  └────────────────┘  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Entertainment/Streaming Website Architecture
```
┌─ Entertainment Specific Concerns ────────────────────────────────────┐
│                                                                      │
│  ┌─ Media Delivery ─────┐  ┌─ User Experience ───┐  ┌─ Monetization ┐ │
│  │ - Streaming Quality  │  │ - Recommendations   │  │ - Subscriptions│ │
│  │ - Adaptive Bitrate   │  │ - Watchlist/History │  │ - Advertising  │ │
│  │ - DRM Protection     │  │ - Ratings/Reviews   │  │ - Tiered Access│ │
│  │ - Multi-device       │  │ - Personalization   │  │ - Pay-per-view │ │
│  └────────────────────┘  └────────────────────┘  └────────────────┘ │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

### Landing Page Architecture
```
┌─ Landing Page Specific Concerns ─────────────────────────────────────┐
│                                                                      │
│  ┌─ Conversion Optimization ┐  ┌─ Messaging Strategy ┐  ┌─ Analytics ┐ │
│  │ - Value Proposition     │  │ - Copy Hierarchy    │  │ - Conversion│ │
│  │ - CTA Design            │  │ - Pain Points       │  │   Tracking  │ │
│  │ - Form Optimization     │  │ - Benefits          │  │ - Heatmaps  │ │
│  │ - A/B Testing           │  │ - Social Proof      │  │ - User Flow │ │
│  └────────────────────────┘  └────────────────────┘  └────────────┘ │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

### Web Application/SaaS Architecture
```
┌─ SaaS Specific Concerns ───────────────────────────────────────────┐
│                                                                    │
│  ┌─ User Management ────┐  ┌─ Core Features ────┐  ┌─ Billing ───┐ │
│  │ - Authentication     │  │ - Feature Modules   │  │ - Plans     │ │
│  │ - Authorization      │  │ - Data Processing   │  │ - Payment   │ │
│  │ - User Settings      │  │ - API Integration   │  │ - Invoicing │ │
│  │ - Team Management    │  │ - Workflows         │  │ - Usage     │ │
│  └────────────────────┘  └────────────────────┘  └────────────┘  │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

## 🧠 Universal Pattern Recognition Map

### Code Structure Patterns
- **Server-Component Pattern**: `async function Page/Component({ params }) + await fetch/db`
- **Client-Interactive Pattern**: `'use client'; useState/useEffect + event handlers`
- **Data-Fetch Pattern**: `getData` functions paired with React Server Components
- **Layout Pattern**: Hierarchical layouts with global elements in parent layouts

### Implementation Patterns
- **Auth Flow Pattern**: Server-side session checking → client-side UI states
- **Data Display Pattern**: Skeleton loading → data fetch → render with error boundaries
- **Form Pattern**: Zod schema → form component → server action → response handling
- **Filter Pattern**: URL-based state → server-side filtering → paginated results

## 📊 Project Progress Dashboard
Overall Progress: 0% Complete
- Setup & Configuration    □□□□□□□□□□   0%
- Core Features           □□□□□□□□□□   0%
- Admin Dashboard         □□□□□□□□□□   0%
- User Features           □□□□□□□□□□   0%
- Advanced Features       □□□□□□□□□□   0%
- Testing & Deployment    □□□□□□□□□□   0%
- Post-Launch             □□□□□□□□□□   0%

## 🛡️ Critical Standards

### Technical Quality Standards
| Category | Standards |
|----------|-----------|
| Type Safety | • No `any` types<br>• Explicit return types on functions<br>• Proper interface definitions |
| Error Handling | • Try/catch blocks around async operations<br>• Graceful fallbacks<br>• Error logging |
| Performance | • Proper component splitting<br>• Data fetching optimizations<br>• Bundle size monitoring |
| Security | • Input validation<br>• Authentication checks<br>• CSRF protection |

### Testing Coverage Requirements
| Component Type | Minimum Coverage | Required Test Types |
|----------------|------------------|---------------------|
| UI Components | 80% | • Unit tests<br>• Snapshot tests |
| Pages | 70% | • Loading states<br>• Error states<br>• Integration tests |
| API Routes | 90% | • Input validation<br>• Auth checks<br>• Error handling |
| Utility Functions | 95% | • Unit tests<br>• Edge cases |
| State Management | 85% | • State transitions<br>• Side effects |

## 📋 Scratchpad
[Use this space for active task planning and notes]

## 🔄 Implementation Templates

### Server Component Template
```tsx
export async function PageComponent({ 
  params,
  searchParams 
}: {
  params: { id: string },
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  // Data fetching
  const data = await getData(searchParams);
  
  // Error handling
  if (!data) {
    return <ErrorComponent message="Failed to load data" />;
  }
  
  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-8">Page Title</h1>
      
      {/* Suspense boundary for client components */}
      <Suspense fallback={<LoadingSkeleton />}>
        <ContentComponent data={data} />
      </Suspense>
    </div>
  );
}
```

### Client Component Template
```tsx
'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';

export default function InteractiveComponent({ 
  initialData,
  onDataChange 
}: ComponentProps) {
  // Local state
  const [data, setData] = useState(initialData);
  const router = useRouter();
  
  // Event handlers
  const handleChange = (name: string, value: string) => {
    const newData = { ...data, [name]: value };
    setData(newData);
    
    // Update URL params
    const params = new URLSearchParams();
    Object.entries(newData).forEach(([key, value]) => {
      if (value) params.set(key, value);
    });
    
    router.push(`?${params.toString()}`);
    if (onDataChange) onDataChange(newData);
  };
  
  return (
    <div className="space-y-4">
      {/* UI components */}
    </div>
  );
}
```

### Data Fetching Template
```tsx
// In lib/data.ts
export async function getData(
  filters: Record<string, string | string[] | undefined>
) {
  try {
    const { param1, param2, sort } = filters;
    
    // Build query
    const query = {
      where: {},
      orderBy: {},
      include: { related: true }
    };
    
    if (param1) {
      query.where.param1 = param1.toString();
    }
    
    if (param2) {
      query.where.param2 = param2.toString();
    }
    
    if (sort) {
      const [field, direction] = sort.toString().split('-');
      query.orderBy[field] = direction;
    }
    
    // Execute query (with error handling and timeout)
    const data = await prisma.model.findMany(query);
    return data;
  } catch (error) {
    console.error("Failed to fetch data:", error);
    return null;
  }
}