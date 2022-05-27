# ~/.config/fish/config.fish

starship init fish | source

if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

# neofetch
#maifetch -i ~/Pictures/1cu13.png

set -gx EDITOR lvim
set -gx VISUAL lvim

set -gx FZF_COMPLETION_TRIGGER '**'
set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always'
set -gx FZF_DEFAULT_OPTS '--ansi'

set -gx QT_QPA_PLATFORMTHEME 'qt5ct'

set -gx MPD_PORT 6688

set -gx SSH_AUTH_SOCK '$XDG_RUNTIME_DIR/ssh-agent.socket'

