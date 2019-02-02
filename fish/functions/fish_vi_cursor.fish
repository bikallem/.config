function fish_vi_cursor --on-variable fish_bind_mode
    if set -q __last_fish_bind_mode
        and test $__last_fish_bind_mode = $fish_bind_mode
        return
    end
    set -g __last_fish_bind_mode $fish_bind_mode
    switch $fish_bind_mode
        case insert
            printf '\e]50;CursorShape=1\x7'
        case default
            printf '\e]50;CursorShape=0\x7'
        case "*"
            printf '\e]50;CursorShape=0\x7'
    end
end