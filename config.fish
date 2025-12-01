set -U fish_user_paths $HOME/.cargo/bin $HOME/.local/bin

set -x EDITOR kk

# git
alias pull="git pull origin (git branch --show-current)"
alias push="git push origin (git branch --show-current)"

# daberu
alias eng="daberu --system 'Translate English to Japanese and show a refined English version.'"
set -x DABERU_LOG_PATH "$HOME/.daberu.jsonl"
set -x DABERU_SHELL_EXECUTABLE "fish"
set -x DABERU_MODEL claude-haiku-4-5-20251001

function fix
    daberu -s 'Fix TODO' $argv
end

# dokosa
set -x DOKOSA_INDEX_FILE "$HOME/.dokosa"

function doko
    dokosa search $argv
end

# niho
set -x NIHO_DICTIONARY_FILE "$HOME/rust/niho/dics/default.jsonl"

function gendic
    daberu -s'find entries with the HIRAGANA_ format in the given line. And generate dic kanji entries (JSONL format) for HIRAGANA' -e"cat $NIHO_DICTIONARY_FILE | tail -20" $argv
end

# mame
set -x MAMEDIFF_CONFIG_FILE "$HOME/rust/mamediff/configs/sile.jsonc"
set -x MAMEGREP_CONFIG_FILE "$HOME/rust/mamegrep/configs/sile.jsonc"
