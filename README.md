# 🎯 Cursor Rules Builder

A modular toolkit for building custom Cursor AI rule sets. This repository provides a collection of well-organized rule modules that you can mix and match to create the perfect ruleset for your project.

## 🚀 Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/cursor-rules-builder.git
   cd cursor-rules-builder
   ```

2. **Generate Your Rules**
   ```powershell
   # Windows (PowerShell)
   ./build-rules.ps1 -modules @("core/checklist", "patterns/nextjs")
   ```

   This will create a `.cursor/rules/combined-rules.mdc` file with your selected modules.

## 📦 Available Modules

### Core Modules (`modules/core/`)
- `checklist.mdc` - Essential pre-implementation checklist
- `ai-instructions.mdc` - Core AI behavior guidelines
- `progress-dashboard.mdc` - Project progress tracking

### Pattern Modules (`modules/patterns/`)
- `nextjs-patterns.mdc` - Next.js best practices and patterns
- `testing-patterns.mdc` - Testing standards and practices

### Project Types (`modules/project-types/`)
- `saas.mdc` - SaaS-specific patterns and architecture
- `ecommerce.mdc` - E-commerce specific rules
- `blog.mdc` - Blog and content site patterns

## 🛠️ Customization

1. **Select Your Modules**
   Choose which modules you want to include. For example, for a Next.js SaaS project:
   ```powershell
   ./build-rules.ps1 -modules @(
       "core/checklist",
       "core/ai-instructions",
       "patterns/nextjs",
       "project-types/saas"
   )
   ```

2. **Custom Output Location**
   Specify a different output location:
   ```powershell
   ./build-rules.ps1 -outputPath "path/to/your/rules.mdc"
   ```

## 📋 Module Format

Each module follows this structure:
```markdown
---
description: Module purpose and when to use it
globs: file patterns this applies to (optional)
alwaysApply: true/false
---

# Module Title

## Section
- Rule 1
- Rule 2

## Examples
<example>
✅ Valid example
</example>

<example type="invalid">
❌ Invalid example
</example>
```

## 🤝 Contributing

1. **Add New Modules**
   - Create a new `.mdc` file in the appropriate directory
   - Follow the module format above
   - Include clear examples
   - Submit a pull request

2. **Improve Existing Modules**
   - Keep rules concise and actionable
   - Add relevant examples
   - Update patterns for new versions

## 📝 License

MIT

## 🙏 Acknowledgements

- [Cursor](https://www.cursor.so/) for creating the amazing AI-powered code editor that inspired this rules toolkit.
- All contributors to the Cursor community whose shared rules and discussions informed these modules.
- Special thanks to open-source maintainers everywhere – you keep the ecosystem thriving!

---

> Note: This repository uses the new `.mdc` format recommended by Cursor. If you're using an older version of Cursor that requires `.cursorrules`, you can still use the generated files - just rename the extension.

## 🕰 Legacy Rule Files

This repository originally shipped with a **single root** `.cursorrules` file and a collection of large, self-contained rule files in the `rules/` directory (e.g. `.cursorrules-web-saas`, `.cursorrules-ecommerce`, etc.).

Those files are **still in the repo** and will continue to work in **older versions of Cursor** that rely on the legacy format.

* **Root rule:** `.cursorrules` (applies to every project opened in this repo).
* **Specialised rules:** located under `rules/` – each one is a complete ruleset you can copy-paste into your own `.cursorrules` file or into Cursor → Settings → “Rules for AI”.

> ⚠️ **No files have been deleted.** The new modular system lives side-by-side with the legacy rules. Choose whichever approach fits your workflow.

When you’re ready to migrate, simply switch to the modular builder (`build-rules.ps1`) and ignore the old files – or keep both if you need to support multiple Cursor versions.
