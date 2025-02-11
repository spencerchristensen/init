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
    mise activate fish | source

    alias vim nvim

    fish_add_path '/Applications/Sublime Text.app/Contents/SharedSupport/bin'
    fish_add_path '/Applications/Sublime Merge.app/Contents/SharedSupport/bin'

    source /Users/spencer.christensen/.config/op/plugins.sh
end
