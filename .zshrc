

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply


eval "$(direnv hook zsh)"


export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'


export PATH="/usr/local/sbin:$PATH"

if [ "$TMUX" = "" ]; then tmux; fi

alias ls='exa'
alias la='exa --all'
alias ll='exa -l'
alias lll='exa -l | less'
alias lla='exa -la'
alias llt='exa -T'
alias llfu='exa -bghHliS --git'
