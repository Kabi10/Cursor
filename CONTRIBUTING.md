# Contributing to Cursor Rules Builder

First off, thank you for considering contributing to the Cursor Rules Builder! It's people like you that make this tool better for everyone.

## Ways to Contribute

1. **Add New Modules**
   - Create modules for new frameworks or patterns
   - Add project-type specific rules
   - Contribute testing or deployment patterns

2. **Improve Existing Modules**
   - Update patterns for new framework versions
   - Add more examples
   - Clarify instructions
   - Fix typos or formatting

3. **Enhance Build Tools**
   - Improve the build scripts
   - Add validation
   - Support more platforms

## Module Guidelines

### File Structure
```markdown
---
description: Clear description of when this module applies
globs: relevant/files/**/*.ext
alwaysApply: false
---

# Module Title

## Section Name
- Rule 1
- Rule 2

## Examples

<example>
✅ Valid example with explanation
</example>

<example type="invalid">
❌ Invalid example with explanation
</example>
```

### Best Practices
- Keep modules focused and single-purpose
- Include both valid and invalid examples
- Use clear, actionable language
- Add emojis only when they add value
- Keep line length reasonable (< 80 characters preferred)
- Use proper markdown formatting

## Pull Request Process

1. **Fork & Clone**
   ```bash
   git clone https://github.com/your-username/cursor-rules-builder.git
   cd cursor-rules-builder
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes**
   - Add/modify modules in the appropriate directory
   - Test your changes with the build script
   - Update documentation if needed

4. **Commit**
   ```bash
   git add .
   git commit -m "feat: add new module for framework X"
   ```
   Follow [Conventional Commits](https://www.conventionalcommits.org/)

5. **Push & Create PR**
   ```bash
   git push origin feature/your-feature-name
   ```
   Then create a Pull Request on GitHub

## Development Setup

1. **Requirements**
   - PowerShell 5.1+ or Bash
   - Text editor with markdown support
   - Cursor IDE (for testing)

2. **Testing Your Changes**
   ```powershell
   # Windows
   ./build-rules.ps1 -modules @("your-new-module")
   ```
   ```bash
   # Linux/Mac
   ./build-rules.sh --modules your-new-module
   ```

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Follow project conventions

## Questions?

Feel free to:
- Open an issue for questions
- Start a discussion for ideas
- Reach out to maintainers

Thank you for contributing! 🙏 