GO_BIN=$ ( which go 2> /dev/null )
if [ -n "$GO_BIN" ]; then
    export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
fi
