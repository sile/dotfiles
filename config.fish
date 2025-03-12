set -U fish_user_paths $HOME/.cargo/bin $HOME/.local/bin

set -x EDITOR emacs

# HTTP server
if ! ps aux | grep rofis | grep -v grep > /dev/null
    rofis -d -r $HOME
end

# ChatGPT
alias eng="daberu --system 'Translate English to Japanese and show a refined English version.'"
alias refine "daberu --system 'Please refine the code.'"
alias fixtodo "daberu --system 'When resolving TODOs, provide the completed code in plain text format without any markdown formatting, code block symbols, or additional commentary surrounding the code. The output should be ready for direct copy-paste into the target source code including sorrounding lines.'"
alias autocommit "git commit -m (git diff --cached | daberu --system 'Generate one-line commit message from the git diff result')"
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
