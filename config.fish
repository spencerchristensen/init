if status is-interactive
    function ll
        eza -l --color-scale --group-directories-first -o $argv
    en

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
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end
