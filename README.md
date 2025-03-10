# Cursor AI Templates

![Cursor AI Logo](https://cursor.sh/brand/cursor-logo-dark.png)

## 🚀 Supercharge Your Development Workflow with Cursor AI Templates

This repository contains a collection of specialized templates and helpful files for [Cursor](https://cursor.sh/), the AI-first code editor. These templates help you establish consistent workflows, enforce best practices, and maximize the effectiveness of AI assistance in your development process.

## 📋 What's Inside

- **Specialized Templates**: Domain-specific templates for different types of applications:
  - Web Applications & SaaS
  - E-commerce
  - Content Management
  - Educational Platforms
  - Entertainment & Streaming
  - Business Applications
  - Portfolio Sites

## 🔧 Step-by-Step Guide to Using These Templates

### Getting Started

1. **Browse the Repository**: 
   - Explore the `rules` directory to find the template that best fits your project needs
   - Choose a specialized template based on your project type

2. **Choose Your Template**:
   - For web applications: Check `rules/web-apps/` directory
   - For e-commerce projects: Check `rules/e-commerce/` directory
   - For content-focused sites: Check `rules/content/` directory
   - For specialized applications: Check `rules/specialized/` directory

### Option 1: Using Templates as Custom Instructions (Recommended)

1. **Navigate** to your chosen template file (e.g., `rules/specialized/Web_App_SaaS_rules`)
2. **Click** on the file to view its contents
3. **Click** the "Raw" button to view the raw markdown
4. **Select All** (Ctrl+A or Cmd+A) and **Copy** (Ctrl+C or Cmd+C) the entire content
5. **Open Cursor AI** on your computer
6. **Click** on your profile icon in the bottom left corner
7. **Select** "Settings"
8. **Navigate** to "AI" → "Custom Instructions"
9. **Delete** any existing content in the custom instructions field (if necessary)
10. **Paste** (Ctrl+V or Cmd+V) the template content into the field
11. **Click** "Save"
12. **Start a new conversation** with Cursor AI to begin using the template

### Option 2: Using Templates for Specific Projects

1. **Copy** the desired template content as described above
2. **Open** your project in Cursor
3. **Start a new conversation** with Cursor AI
4. **Type and send** the following message:
   ```
   Please use the following instructions for this project:
   
   [PASTE TEMPLATE HERE]
   ```
5. **Continue** your conversation with Cursor AI, which will now follow the template guidelines

### Option 3: Creating a .cursorrules File (For Advanced Users)

1. **Copy** your chosen template content
2. **Create** a new file named `.cursorrules` in the root of your project
3. **Paste** the template content into this file
4. **Save** the file
5. Cursor will automatically use these rules when working within this project

## 🌟 Template Highlights

### Specialized Templates

Each template is designed with domain-specific:
- Best practices
- Common pitfalls to avoid
- Industry-standard patterns
- Performance considerations
- Security requirements

## 🛠️ Customizing Templates

Feel free to customize these templates to better fit your specific needs:

1. **Fork** this repository
2. **Clone** your forked repository to your local machine
3. **Modify** the templates as needed
4. **Commit** and **push** your changes
5. **Use** your customized versions in Cursor

## 📚 Template Structure

Each template follows a consistent structure:

```
# Template Name

## ⚠️ MANDATORY PRE-IMPLEMENTATION CHECKLIST ⚠️
[Exploration and documentation requirements]

## 🏗️ IMPLEMENTATION GUIDELINES
[Domain-specific best practices]

## 🔍 QUALITY ASSURANCE
[Testing and validation requirements]

## 🔒 SECURITY CONSIDERATIONS
[Security best practices]
```

## 🤝 Contributing

Contributions are welcome! If you have improvements or new templates to share:

1. Fork the repository
2. Create a new branch (`git checkout -b my-new-template`)
3. Add your template to the appropriate directory
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [Cursor AI](https://cursor.sh/) for creating an amazing AI-powered code editor
- All contributors who have helped improve these templates

---

Happy coding with Cursor AI! 🚀
