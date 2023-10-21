# prevent "ctrl-d" from terminating interactive shell
set -o ignoreeof

## brew install nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## brew install lsd 
alias lsd="lsd --group-directories-first --icon-theme=unicode"

## NOT "brew install zsh-git-prompt": use zsh-git-prompt/zsh-git-prompt fork instead
source ~/.zsh-git-prompt/zshrc.sh
export PROMPT=$'[%B%m %~] %b$(git_super_status)\n%# ' # Sacrifice two-line for legibility
export RPROMPT='%(?..[%?] )' # Most recent exit code

# enable grep default colorization
export GREP_OPTIONS='--color=auto'

# enable ls default colorization
export CLICOLOR=true

# ask less to colorize man-pages
export MANPAGER="less -R --use-color -Ddg -Du+y"

## brew install zsh-completions
##  To make Homebrew’s completions available in zsh, you must insert 
##  the Homebrew-managed zsh/site-functions path into your FPATH 
##  before initialising zsh’s completion facility
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
