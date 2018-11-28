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
set -x DISPLAY localhost:0.0
set -x DOCKER_HOST tcp://localhost:2375

if not ps aux | grep rofis | grep -v grep > /dev/null
        cd $HOME/dev; and rofis -d
end

if [ "$TMUX" = "" ]
    if not tmux attach
        tmux
    end
end
