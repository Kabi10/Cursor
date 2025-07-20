#!/bin/bash

# Default values
modules=("core/checklist" "core/ai-instructions")
output_path=".cursor/rules/combined-rules.mdc"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --modules)
            IFS=',' read -ra modules <<< "$2"
            shift 2
            ;;
        --output)
            output_path="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Create output directory if it doesn't exist
mkdir -p "$(dirname "$output_path")"

# Initialize the combined content
cat > "$output_path" << EOL
---
description: Combined rules from modules: ${modules[*]}
globs: 
alwaysApply: true
---

# Combined Cursor Rules
Generated from selected modules on $(date '+%Y-%m-%d %H:%M:%S')

EOL

# Process each module
for module in "${modules[@]}"; do
    module_path="modules/$module.mdc"
    
    if [ -f "$module_path" ]; then
        echo -e "\n## Module: $module" >> "$output_path"
        
        # Extract content between frontmatter markers and remove trailing frontmatter
        sed -n '/^---$/,/^---$/!p' "$module_path" | \
        sed '/^description:/,/^---$/d' | \
        sed '/^[[:space:]]*$/d' >> "$output_path"
    else
        echo "Warning: Module not found: $module_path"
    fi
done

echo -e "\nRules file generated at: $output_path"
echo "Included modules: ${modules[*]}"
echo -e "\nPreview of the first few lines:"
head -n 10 "$output_path" 