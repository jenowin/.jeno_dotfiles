#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias vc='nvim --clean -c "syntax enable | set nu | set mouse=a | set clipboard=unnamed | set expandtab | set autoindent | set shiftwidth=2 | set softtabstop=2 | set tabstop=2 | set smarttab | set scrolloff=4"'
alias brc="nvim ~/.bashrc"
alias cls=clear
alias q=exit

alias em="emacs --with-profile jen "
alias emn="emacs --with-profile jen -nw"
alias at='alacritty-themes'
alias df="/usr/bin/git --git-dir=$HOME/.jeno_dotfiles/ --work-tree=$HOME"

# xorg brightness
function xbr() {
  # set brightness for all x screens that are connected.
  if [ $1 == 'a' ]; then
    screens=$(xrandr |awk '/connected/{if($2 == "connected")print $1}')
    for screen in $screens
    do
      xrandr --output $screen --brightness $2
    done
  else
    xrandr --output $1 --brightness $2
  fi
}

function xrr() {
  xset r rate 350 50
}
