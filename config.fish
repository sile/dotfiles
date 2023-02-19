set -U fish_user_paths $HOME/.cargo/bin $HOME/.local/bin

touch ~/.ssh-agent-info
source ~/.ssh-agent-info > /dev/null
ssh-add -l > /dev/null
if [ $status = 2 ]
    ssh-agent -c > ~/.ssh-agent-info
    source ~/.ssh-agent-info
end

if not ssh-add -l > /dev/null
    ssh-add
end

set -x LD_LIBRARY_PATH (rustc --print sysroot)/lib:(rustc +nightly --print sysroot)/lib
set -x DISPLAY :0  # for WSLg
set -x EDITOR emacs

if [ "$TMUX" = "" ]
    if not tmux attach
        tmux
    end
end

# Erlang
set -x ERL_AFLAGS "+pc unicode -kernel shell_history enabled"

# HTTP server
if ! ps aux | grep rofis | grep -v grep > /dev/null
    rofis -d -r $HOME
end
