# prevent "ctrl-d" from terminating interactive shell
set -o ignoreeof
# allow '#' comments in the shell, goddamnit zsh
set -k

# Make word navigation sane
autoload -U select-word-style
select-word-style bash

## brew install nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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

if [[ -o interactive && ${SHLVL:-1} -le 1 ]]; then
  if [[ -z "$VSCODE_INJECTION" ]]; then
    neofetch
  fi
  if [[ -n "${SSH_AUTH_SOCK:-}" ]]; then
    ssh-add -l >/dev/null 2>&1 || ssh-add --apple-load-keychain
  fi
fi
# this used to be one line: now it's in .config/neofetch/config.conf instead
# echo iface $(tput md setaf 145)en0$(tput sgr0)', addr '$(tput setaf 212)$(ifdata -pa en0)$(tput sgr0)', mask '$(tput setaf 179)$(ifdata -pn en0)$(tput sgr0)', gw '$(tput setaf 29)$(ipconfig getoption en0 router) 
alias ipsummary="ipconfig getsummary en0| egrep 'yiaddr|router|subnet_mask'| egrep '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'"
alias randomstr2pasteboard="openssl rand -base64 15 | tee /dev/tty | pbcopy"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/conny/.cache/lm-studio/bin"

# uv tool install
export PATH="/Users/conny/.local/bin:$PATH"

# bun completions
[ -s "/Users/conny/.bun/_bun" ] && source "/Users/conny/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Antigravity
export PATH="/Users/conny/.antigravity/antigravity/bin:$PATH"

# Amp CLI
export PATH="/Users/conny/.amp/bin:$PATH"
