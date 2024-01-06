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

set -x EDITOR emacs

# HTTP server
if ! ps aux | grep rofis | grep -v grep > /dev/null
    rofis -d -r $HOME
end

# ChatGPT
alias eng="daberu --system 'Translate English to Japanese and show a refined English version.'"
