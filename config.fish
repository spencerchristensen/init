if status is-interactive
    function ll
        eza -l --color-scale --group-directories-first -o $argv
    end

    function la
        eza -l -a --color-scale --group-directories-first -o $argv
    end

    function cat
        bat --style=plain --paging=never --terminal-width=$COLUMNS --color=always $argv
    end

    function ut
        date +%s
    end

    fzf --fish | source
    zoxide init fish | source
    alias vim nvim
    mise activate fish | source
    set -x EDITOR nvim
end
