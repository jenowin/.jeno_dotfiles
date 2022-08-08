# eval "$(oh-my-posh init zsh --config ~/.poshthemes/sorin.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/star.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/atomicBit.omp.json)"

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Load aliases and shortcuts if existent.
zsh_source_file() {
    [ -f "$1" ] && source "$1"
    return 0 # avoid non-zero return codes when file does not exists
}
zsh_source_file "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
zsh_source_file "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functionrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

#keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^[[Z' reverse-menu-complete

plugins=( 
    # other plugins...
    zsh-autosuggestions
)
