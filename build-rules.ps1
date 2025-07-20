param(
    [Parameter(Mandatory=$false)]
    [string[]]$modules = @("core/checklist", "core/ai-instructions"),
    
    [Parameter(Mandatory=$false)]
    [string]$outputPath = ".cursor/rules/combined-rules.mdc"
)

# Create output directory if it doesn't exist
$outputDir = Split-Path -Parent $outputPath
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir
}

# Initialize the combined content with UTF-8 BOM
$combinedContent = @"
---
description: Combined rules from modules: $($modules -join ', ')
globs: 
alwaysApply: true
---

# Combined Cursor Rules
Generated from selected modules on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

"@

# Process each module
foreach ($module in $modules) {
    $modulePath = Join-Path "modules" "$module.mdc"
    
    if (Test-Path $modulePath) {
        # Read the content with UTF-8 encoding
        $moduleContent = Get-Content $modulePath -Raw -Encoding UTF8
        
        # Strip the frontmatter and any trailing frontmatter
        $moduleContent = $moduleContent -replace "(?ms)^---.*?---\r?\n", ""
        $moduleContent = $moduleContent -replace "(?ms)\r?\ndescription:.*?---\s*$", ""
        
        # Add module content to combined content with proper spacing
        $combinedContent += "`n`n## Module: $module`n"
        $combinedContent += $moduleContent.Trim()
    }
    else {
        Write-Warning "Module not found: $modulePath"
    }
}

# Write the combined content to the output file with UTF-8 encoding
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllText($outputPath, $combinedContent, $Utf8NoBomEncoding)

Write-Host "`nRules file generated at: $outputPath"
Write-Host "Included modules: $($modules -join ', ')`n"

# Display a preview of the generated file
Write-Host "Preview of the first few lines:"
Get-Content $outputPath -Head 10 