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
alias refine "daberu --system 'Please refine the code.'"
alias fixtodo "daberu --system 'When resolving TODOs, provide the completed code in plain text format without any markdown formatting, code block symbols, or additional commentary surrounding the code. The output should be ready for direct copy-paste into the target source code including sorrounding lines.'"
alias autocommit "git commit -m (git diff --cached | daberu --system 'Generate one-line commit message from the git diff result')"
set -x DABERU_MODEL "claude-sonnet-4-20250514"
set -x DABERU_LOG_PATH "$HOME/.daberu.jsonl"
