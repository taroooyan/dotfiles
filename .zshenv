export EDITOR=vim

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# go
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# run tmux
tmux -2
