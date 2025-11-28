function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert

    bind -M fish_vi_command \$ end-of-line
    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search
end
