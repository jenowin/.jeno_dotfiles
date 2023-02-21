. ($PSScriptRoot + "\prompt.ps1")
Import-Module -Name Terminal-Icons

If (Test-Path Alias:pwd) {remove-item alias:pwd}
If (Test-Path Alias:del) {Remove-Alias -Name del -Force}
If (Test-Path Alias:rd) {remove-item alias:rd}
If (Test-Path Alias:rm) {remove-item alias:rm} # alias to Remove-Item-ToRecycleBin() function

# General Aliases
Set-Alias -Name np -Value "C:\Windows\notepad.exe"
Set-Alias -Name v -Value "nvim"
Set-Alias -Name e -Value emacsclientw

function pwd{(Get-Location | ft -HideTableHeaders | Out-String).Trim()}
function q(){ exit}
function ll() {Get-ChildItem $args -Exclude .* | Format-Wide -AutoSize -Force}
function la() {Get-ChildItem $args | Format-Wide -AutoSize -Force}
function ln() {ls $args | Format-TerminalIcons}
function lm() {$(ls $args[0] | Measure-Object).count}
function get() {Get-Content $args[0] | Select -Index ($args[1] - 1)}
function which() {(Get-Command $args).Source}

$env:EMACS_SERVER_FILE="C:\Users\jenowin\EMACS\PROFILES\main-config\server\user"
#$env:EMACS_SERVER_FILE="C:\Users\jenowin\EMACS\PROFILES\suckless\server\jen"
function vc() { nvim.exe --clean -c "syntax enable | set nu | set mouse=a | set clipboard=unnamed | set expandtab | set autoindent | set shiftwidth=2 | set softtabstop=2 | set tabstop=2 | set smarttab | set scrolloff=4" $args }

function mni() {
  $skipped=0
    $created=0
    for ($i = 0; $i -lt $args.count; $i++ ) {
# if file not exist in the current dir it returns flase, then create file
# -PathType Leaf  part tells the cmdlet to check for a file and not a directory explicitly.
      if (-not(Test-Path -Path $args[$i] -PathType Leaf)) {
        try {
          $null = New-Item -ItemType File -Path $args[$i] -Force -ErrorAction Stop
            Write-Host "$($args[$i]) Created!"
            $created++
        }
        catch {
#throw $_.Exception.Message
          Write-Host "Can't create $($args[$i])" -ForegroundColor red
        }
      }
# If the file already exists, show the message and do nothing.
      else {
        Write-Host "$($args[$i]) exists!" -Foregroundcolor DarkYellow
          $skipped++
      }
    }

  if($skipped -gt 0) {
    write-host "$skipped files already Exist!" -ForegroundColor DarkYellow
  }
  if($created -gt 0){
    write-host "$created files created!"
  }
}

function mdel() {
  for ( $i = 0; $i -lt $args.count; $i++ ) {
    Remove-Item "$($args[$i])"
  }
  write-host "$($args.count) files deleted!"
}

function mio() {
# In Progress ---
#  for ( $i = 0; $i -lt $args.count; $i++ ) {
#    Move-Item "$($args[$i])"
#  }
#write-host "$($args.count) files/dir moved!"
# features:
# 1. mio * destiny -r  (when selecting all exclude destiny folder)
# 2. mio f1 f2 f3 destiny
  write-host $args
}

# key strokes
#Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

Add-Type -AssemblyName Microsoft.VisualBasic
function Remove-Item-ToRecycleBin() {
  [CmdletBinding()]
    [Alias("rm")]
      Param(
          [Parameter(Mandatory=$true)]
          [ValidateNotNullOrEmpty()]
          [string] $Path
          )

        $item = Get-Item -Path $Path -ErrorAction SilentlyContinue
        if ($item -eq $null)
        {
          Write-Error("'{0}' not found" -f $Path)
        }
        else
        {
          $fullpath=$item.FullName
            Write-Verbose ("Moving '{0}' to the Recycle Bin" -f $fullpath) -verbose
            if (Test-Path -Path $fullpath -PathType Container)
            {
              [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($fullpath,'OnlyErrorDialogs','SendToRecycleBin')
            }
            else
            {
              [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($fullpath,'OnlyErrorDialogs','SendToRecycleBin')
            }
        }
}
