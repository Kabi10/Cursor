# Cursor AI Rules

## 🚀 Supercharge Your Development Workflow with Cursor AI Rules

This repository contains a collection of specialized rule files for [Cursor](https://www.cursor.so/), the AI-first code editor. These rules help you establish consistent workflows, enforce best practices, and maximize the effectiveness of AI assistance in your development process.

## 📋 Repository Structure

```
cursor-rules/
├── README.md                       # Project documentation
├── rules/                          # Specialized rule files
│   ├── .cursorrules-master         # Core master template
│   ├── .cursorrules-web-general    # General web development
│   ├── .cursorrules-web-landing    # Landing page specific
│   ├── .cursorrules-web-saas       # Web app & SaaS specific
│   ├── .cursorrules-ecommerce      # E-commerce specific
│   ├── .cursorrules-blog           # Blog specific
│   ├── .cursorrules-news           # News & media specific
│   ├── .cursorrules-social         # Social media specific
│   ├── .cursorrules-business       # Business websites
│   ├── .cursorrules-education      # Educational platforms
│   ├── .cursorrules-entertainment  # Entertainment & streaming
│   └── .cursorrules-portfolio      # Portfolio sites
└── .gitignore                      # Git ignore file
```

## ✨ Comprehensive Rule Format

All rule files now follow a standardized comprehensive format that includes:

1. **Title** - Clear identification of the rule type
2. **Architecture Map** - Visual ASCII diagram of the specific website/platform architecture
3. **Mandatory Pre-Implementation Checklist** - Standardized process for code changes
4. **Implementation Plan** - Detailed phased approach specific to each website type
5. **Pattern Recognition Map** - Domain-specific patterns for each website type
6. **Progress Dashboard** - Standardized progress tracking
7. **Critical Standards** - Technical quality and testing requirements
8. **Scratchpad** - Area for current tasks and notes

## 🔧 How to Use These Rules

### Getting Started

1. **Browse the Repository**: 
   - Explore the `rules` directory to find the rule file that best fits your project needs
   - Start with `.cursorrules-master` for general development or choose a specialized rule file

2. **Choose Your Rule File**:
   - For general development: Use `.cursorrules-master`
   - For web applications: Check `.cursorrules-web-general`, `.cursorrules-web-landing`, or `.cursorrules-web-saas`
   - For e-commerce projects: Use `.cursorrules-ecommerce`
   - For content-focused sites: Check `.cursorrules-blog`, `.cursorrules-news`, or `.cursorrules-social`
   - For specialized applications: Check `.cursorrules-business`, `.cursorrules-education`, `.cursorrules-entertainment`, or `.cursorrules-portfolio`

### Option 1: Using Rules as Custom Instructions (Recommended)

1. **Navigate** to your chosen rule file (e.g., `rules/.cursorrules-web-saas`)
2. **Open** the file to view its contents
3. **Select All** (Ctrl+A or Cmd+A) and **Copy** (Ctrl+C or Cmd+C) the entire content
4. **Open Cursor AI** on your computer
5. **Click** on your profile icon in the bottom left corner
6. **Select** "Settings"
7. **Navigate** to "AI" → "Custom Instructions"
8. **Delete** any existing content in the custom instructions field (if necessary)
9. **Paste** (Ctrl+V or Cmd+V) the rule content into the field
10. **Click** "Save"
11. **Start a new conversation** with Cursor AI to begin using the rules

### Option 2: Using Rules for Specific Projects

1. **Copy** the desired rule content as described above
2. **Open** your project in Cursor
3. **Start a new conversation** with Cursor AI
4. **Type and send** the following message:
   ```
   Please use the following instructions for this project:
   
   [PASTE RULE CONTENT HERE]
   ```
5. **Continue** your conversation with Cursor AI, which will now follow the rule guidelines

### Option 3: Creating a .cursorrules File (For Advanced Users)

1. **Copy** your chosen rule file
2. **Create** a new file named `.cursorrules` in the root of your project
3. **Paste** the rule content into this file
4. **Save** the file
5. Cursor will automatically use these rules when working within this project

## 🌟 Rule Highlights

### Master Rules

The comprehensive workflow rules that enforce:
- Thorough codebase exploration before implementation
- Documentation of findings and approach
- Structured implementation plans
- Code quality and security checks

### Specialized Rules

Each specialized rule file extends the master rules with domain-specific:
- Architecture maps showing the structure of that type of website/application
- Tailored implementation plans with phases specific to that domain
- Feature patterns relevant to that type of website
- Specific critical standards and testing requirements

## 🏗️ Architecture Maps

Each rule file contains a detailed ASCII architecture map that visualizes:

- **UI/Frontend Layer** - Page components and client-side features
- **Backend/Data Layer** - API routes, databases, and services
- **Domain-Specific Concerns** - Special considerations for each website type

Example (Web SaaS Architecture):
```
┌─ User Interface Layer ───────────────┐      ┌─ Service Layer ─────┐
│                                      │      │                     │
│  ┌─ Page Components ─────────────┐   │      │  ┌─ API Routes ──┐  │
│  │ - Dashboard                   │   │      │  │ - REST API    │  │
│  │ - Settings                    │   │      │  │ - GraphQL     │  │
│  │ - Account Management          │   │      │  │ - WebSockets  │  │
│  └───────────────────────────────┘   │      │  └──────────────┘  │
│                                      │      │                     │
│  ┌─ Client Components ────────────┐  │      │  ┌─ Database ────┐  │
│  │ - Data Visualization           │◄─┼──────┼─►│ - Users       │  │
│  │ - Real-time Updates           │  │      │  │ - Workspaces  │  │
│  │ - Interactive Forms           │  │      │  │ - Settings    │  │
│  └───────────────────────────────┘  │      │  └──────────────┘  │
│                                      │      │                     │
└──────────────────────────────────────┘      └─────────────────────┘

┌─ SaaS Specific Concerns ────────────────────────────────────────┐
│                                                                  │
│  ┌─ Subscription ────┐  ┌─ Multi-tenant ─────┐  ┌─ Analytics ─┐ │
│  │ - Billing         │  │ - Workspace Mgmt   │  │ - Usage     │ │
│  │ - Plans           │  │ - Data Isolation   │  │ - Metrics   │ │
│  │ - Usage Tracking  │  │ - Access Control   │  │ - Reports   │ │
│  └─────────────────┘  └──────────────────┘  └─────────────────┘ │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
```

## 📋 Implementation Plans

Each rule file contains a detailed implementation plan divided into phases:

1. **Setup Phase** - Initial project configuration and dependencies
2. **Core Features Phase** - Essential functionality for the website type
3. **Advanced Features Phase** - Enhanced capabilities and user experience
4. **Optimization Phase** - Performance, analytics, and refinement

## 🧠 Pattern Recognition Maps

Each rule includes a pattern recognition map that identifies common implementation patterns for that domain:

- **UI Patterns** - Common user interface flows and components
- **Data Patterns** - Typical data handling and storage approaches
- **Interaction Patterns** - User engagement and response patterns
- **Domain-Specific Patterns** - Specialized patterns for each website type

## 🛠️ Customizing Rules

Feel free to customize these rules to better fit your specific needs:

1. **Fork** this repository
2. **Clone** your forked repository to your local machine
3. **Modify** the rule files as needed
4. **Commit** and **push** your changes
5. **Use** your customized versions in Cursor

## 🤝 Contributing

Contributions are welcome! If you have improvements or new rule files to share:

1. Fork the repository
2. Create a new branch (`git checkout -b my-new-rule`)
3. Add your rule file to the `rules` directory
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgements

- [Cursor](https://www.cursor.so/) for creating an amazing AI-powered code editor

---

Happy coding with Cursor AI! 🚀
