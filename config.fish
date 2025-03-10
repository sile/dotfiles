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
alias refine "daberu --system 'Please refine the code.'"
set -x DABERU_MODEL "claude-3-7-sonnet-latest"
set -x DABERU_ONESHOT_LOG_PATH "$HOME/tmp/daberu.jsonl"

# Uribo
set -x URIBO_DEFAULT_CONFIG_PATH "$HOME/.uribo"

function fish_command_not_found
    if uribo find $argv[1] > /dev/null 2> /dev/null
        uribo run $argv
    else
        __fish_default_command_not_found_handler $argv[1]
    end
end
