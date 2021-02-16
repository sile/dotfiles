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
# set -x DISPLAY localhost:0.0  # for WSL1
set -x DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0  # for WSL2
# set -x DOCKER_HOST tcp://localhost:2375 # for WSL1

if not ps aux | grep rofis | grep -v grep > /dev/null
        pushd $HOME/dev
        rofis -d
        popd
end

if [ "$TMUX" = "" ]
    if not tmux attach
        tmux
    end
end
