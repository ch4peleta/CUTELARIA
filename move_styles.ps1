$file = "c:\Users\teste\Desktop\p.v  facas\styles.css"
$lines = Get-Content $file

# Define the ranges (0-indexed in array, so line 1 is index 0)
# Line 1219 is index 1218
# Line 1391 is index 1390
# Line 1643 is index 1642

$insertIndex = 1218
$startIndex = 1390
$endIndex = 1642

# Extract the block to move
$block = $lines[$startIndex..($endIndex - 1)]

# Remove the block from the original lines
# We need to be careful with array slicing
$newLines = $lines[0..($startIndex - 1)] + $lines[$endIndex..($lines.Count - 1)]

# Now insert the block at the insertIndex
# Since we removed lines AFTER the insertIndex, the insertIndex is still valid relative to the start of the file
$finalLines = $newLines[0..($insertIndex - 1)] + $block + $newLines[$insertIndex..($newLines.Count - 1)]

$finalLines | Set-Content $file -Encoding UTF8
