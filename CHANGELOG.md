# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-07-19

### Added
- New modular rule system with separate `.mdc` files
- PowerShell and Bash build scripts for combining modules
- Core modules:
  - `checklist.mdc` - Pre-implementation checklist
  - `ai-instructions.mdc` - AI behavior guidelines
- Pattern modules:
  - `nextjs-patterns.mdc` - Next.js best practices
- Cross-platform support with `build-rules.sh`
- Comprehensive contributor guidelines
- Improved .gitignore for better IDE support

### Changed
- Restructured repository to use modular approach
- Moved from single `.cursorrules` to composable modules
- Updated documentation to cover both new and legacy formats

### Maintained
- Legacy `.cursorrules` files kept for compatibility
- Original `cursor-master-rules.txt` preserved
- All specialized rule files in `rules/` directory retained

## [1.0.0] - 2025-03-15

### Added
- Initial release with monolithic structure
- Core master rules template
- Specialized rule files for different project types:
  - Web development (general, landing, SaaS)
  - E-commerce
  - Blog and news
  - Social media
  - Business websites
  - Educational platforms
  - Entertainment & streaming
  - Portfolio sites
- Comprehensive rule format with:
  - Architecture maps
  - Implementation plans
  - Pattern recognition maps
  - Progress dashboards
  - Critical standards

### Features
- Pre-implementation checklist system
- Standardized process for code changes
- Domain-specific architecture patterns
- Technical quality requirements
- Testing standards 