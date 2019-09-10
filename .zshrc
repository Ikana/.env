

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle kubectl
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply


eval "$(direnv hook zsh)"


export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'


export PATH="/usr/local/sbin:$PATH"

# if [ "$TMUX" = "" ]; then tmux; fi

alias ls='exa'
alias la='exa --all'
alias ll='exa -l'
alias lll='exa -l | less'
alias lla='exa -la'
alias llt='exa -T'
alias llfu='exa -bghHliS --git'

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rodrigo.quezada/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rodrigo.quezada/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rodrigo.quezada/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rodrigo.quezada/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.cargo/env

source ~/.blink-profile

export PATH="$(pyenv root)/libexec/pyenv:$PATH"
