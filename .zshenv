# `.zshenv' is sourced on all invocations of the shell, unless the -f option is set. It should contain commands to set the command search path, plus other important environment variables. `.zshenv' should not contain commands that produce output or assume the shell is attached to a tty.
# So, if -f flag is used inside .zshenv then when creating subprocess using a another shell from a exsiting shell it won't evaluate(parse) variables and settings from the sub shells instead uses previous interactive shells(first shell) variables and settings.
# if -f flag is not used it is going to evaluate every process of the shell.
# .zshenv evaluates in both windows managers and Desktop managers.

[[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile" ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile"
