alias ls='ls -hF --color'
alias ll='ls -lhF --color'
alias la='ls -AlhF --color'
alias l='ls -AhF --color'
alias du1='du -d 1 -h'
alias free='free -h'
alias df='df -h'

if [ -n "$CODESPACES" ]; then
    alias wk='cd /workspaces'
else
    alias wk='cd $HOME/works'
fi
