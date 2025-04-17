# Source file path
$sourceFile = "\\Iron-file1\it\Applications\Tekla-Powerfab\2025\TeklaPowerFab2025.exe"

# Target directories
$targetDirs = @(
    "C:\Users\Public\Documents\Tekla\Tekla PowerFab\Update\",
    "C:\Users\Public\Documents\Tekla\Tekla EPM\Update\"
)

# Loop through each target directory and copy the file
foreach ($targetDir in $targetDirs) {
    # Ensure the target directory exists
    if (-not (Test-Path -Path $targetDir)) {
        Write-Output "Creating directory: $targetDir"
        New-Item -ItemType Directory -Path $targetDir -Force
    }

    # Construct the full target file path
    $targetFile = Join-Path -Path $targetDir -ChildPath (Split-Path -Leaf $sourceFile)

    # Copy the file
    Write-Output "Copying $sourceFile to $targetFile"
    Copy-Item -Path $sourceFile -Destination $targetFile -Force
}

Write-Output "File copy operation completed."
