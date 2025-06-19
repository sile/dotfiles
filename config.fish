set -U fish_user_paths $HOME/.cargo/bin $HOME/.local/bin

set -x EDITOR emacs

# HTTP server
if ! ps aux | grep rofis | grep -v grep > /dev/null
    rofis -d -r $HOME
end

# git
alias pull="git pull origin (git branch --show-current)"
alias push="git push origin (git branch --show-current)"

# daberu
alias eng="daberu --system 'Translate English to Japanese and show a refined English version.'"
alias autocommit "git commit -m (git diff --cached | daberu --system 'Generate one-line commit message from the git diff result')"
set -x DABERU_MODEL "claude-sonnet-4-20250514"
set -x DABERU_LOG_PATH "$HOME/.daberu.jsonl"
set -x DABERU_SHELL_EXECUTABLE "fish"

function autocommit
    git commit -m (git diff --cached | env DABERU_LOG_PATH='' daberu -s 'Generate one-line commit message from the git diff result')
end

# dokosa
set -x DOKOSA_INDEX_FILE "$HOME/.dokosa"

function doko
    dokosa search
end
