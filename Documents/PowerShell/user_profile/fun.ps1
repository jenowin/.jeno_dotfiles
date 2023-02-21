# without heading Mode
# $(ls).Mode

# with heading Mode
# ls | Select-Object Mode

# 1. Task
# list without directory and headings {Mode, LastTimewrite, Length, Name}
# list without directory and headings {Mode, LastTimewrite, Length, Name} with terminal icons

# 2. Task 
# See the source code of rm command and reimplement the function Remove-Item-ToRecycleBin() in jeno.ps1
# These Examble commands should work
Remove-Item -LiteralPath "foldertodelete" -Force -Recurse
# or
rm /path -r -force
