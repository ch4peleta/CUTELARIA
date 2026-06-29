$file = "c:\Users\teste\Desktop\p.v  facas\styles.css"
$lines = Get-Content $file

# Define the range to remove (indices)
# Line 1219 is index 1218
# Line 1470 is index 1469
$removeStart = 1218
$removeEnd = 1469

# Extract the block (to verify or just use)
$block = $lines[$removeStart..$removeEnd]

# Remove the block
$tempLines = $lines[0..($removeStart - 1)] + $lines[($removeEnd + 1)..($lines.Count - 1)]

# Insert at line 40 (index 40)
$insertIndex = 40
$finalLines = $tempLines[0..($insertIndex - 1)] + $block + $tempLines[$insertIndex..($tempLines.Count - 1)]

$finalLines | Set-Content $file -Encoding UTF8
