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
HISTFILE="$HOME/.cache/zsh/history"
setopt appendhistory

# elegant functions
source "$ZDOTDIR/functionrc"

# source external files.
zsh_add_file "$ZDOTDIR/aliasrc"
zsh_add_file "$ZDOTDIR/functionrc"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "agkozak/zsh-z"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


#keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^[[Z' reverse-menu-complete


plugins=( 
    # other plugins...
    git
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)
