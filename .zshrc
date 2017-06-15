export GIT_EDITOR=emacs
export GIT_NAME="Rodrigo Quezada"
export GIT_AUTHOR_EMAIL="roderik.ikana@gmail.com"

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarruda/zsh-autosuggestions

antigen theme refined

antigen apply

fortune | cowsay | lolcat
