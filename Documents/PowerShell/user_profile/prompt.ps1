function posh_prompt() {
  [CmdletBinding()]
    param(
        $name =  "sonicboom_dark.omp.json"
        )
      if($name -ne "sonicboom_dark.omp.json") {
        $themes = @("star.omp.json", "ohmyposhv3-v2.json", "hul10.omp.json", "sonicboom_dark.omp.json", "catppuccin.omp.json")
          $name = $themes[$name]
      }
  oh-my-posh --init --shell pwsh --config C:\Users\jenowin\AppData\Local\Programs\oh-my-posh\themes\$name | Invoke-Expression
}
posh_prompt 0

# jenowin's simple prompt with performance
# this function "prompt" is defaultly called
# function prompt {myprompt}
function my_prompt {
  $date = Get-Date
    $time = $date.GetDateTimeFormats()[8]
    $curdir = $ExecutionContext.SessionState.Path.CurrentLocation.Path.Split("\")[-1]

    if($curdir.Length -eq 0) {
      $curdir = $ExecutionContext.SessionState.Drive.Current.Name+":\"
    }

  $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    $prompt_env = $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
        elseif($principal.IsInRole($adminRole)) { "[ADMIN]: " }
        else { '' } )

# with background color
# Write-Host $prompt_env -BackgroundColor White -ForegroundColor Black -NoNewline
# Write-Host ""$env:USERNAME"@"$env:COMPUTERNAME" " -BackgroundColor DarkRed -ForegroundColor Black -NoNewline
# Write-Host " DIR:"$curdir" " -BackgroundColor DarkYellow -ForegroundColor Black -NoNewline
# Write-Host ""$time" " -BackgroundColor DarkGreen -ForegroundColor White -NoNewline

# without background color
    Write-Host $prompt_env -ForegroundColor White -NoNewline
    Write-Host "[" -ForegroundColor DarkRed -NoNewline
    Write-Host $env:USERNAME"@"  -ForegroundColor DarkYellow -NoNewline
    Write-Host $env:COMPUTERNAME -ForegroundColor DarkCyan -NoNewline
    Write-Host ""$curdir -ForegroundColor DarkMagenta -NoNewline
    Write-Host "]" -ForegroundColor DarkRed -NoNewline
#Write-Host ""$time"]" -ForegroundColor DarkGreen -NoNewline

# Dont spill the last background color when the buffer is scrolled,
# instead set the default background
    Write-Host "" -BackgroundColor $Host.UI.RawUI.BackgroundColor
    "> "
}
