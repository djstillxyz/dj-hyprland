if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f ~/git/public/miniconda3/bin/conda
    eval ~/git/public/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "~/git/public/miniconda3/etc/fish/conf.d/conda.fish"
        . "~/git/public/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "~/git/public/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

set -U fish_user_paths ~/.config/emacs/bin $fish_user_paths
set fish_greeting ''

function fish_mode_prompt
    # Empty function to disable mode prompt
end

export EDITOR="emacs"
