set --erase fish_greeting

functions --copy fish_prompt default_fish_prompt

function fish_prompt
  if [ $FISH_PROMPT ]
    echo "$FISH_PROMPT"
  else
    default_fish_prompt
  end
end

set -x HOSTNAME (hostname)

set fish_user_paths       \
  $HOME/bin               \
  $HOME/.local/bin        \
  $HOME/.nix-profile/bin  \
  $HOME/.local/share/npm/node_modules/.bin

set -x EDITOR e

alias node 'env NODE_NO_READLINE=1 rlwrap node'

function alias2 --argument alias command
  alias "$alias" "$command"

  # Set tab completion for the alias that works like the full command
  # https://github.com/fish-shell/fish-shell/issues/393#issuecomment-12689588
  complete -c $alias -a "(
    set -l cmd (commandline -op);
    set -e cmd[1];
    complete -C\"$command \$cmd\";
  )"
end

# https://github.com/fish-shell/fish-shell/issues/838
function readSilent # prompt targetVar
    echo -n $argv[1]
    stty -echo
    head -n 1 | read -g $argv[2]
    stty echo
    echo
end


source ~/nix/shell/nix.fish
source ~/.config/fish/git.fish
source ~/.config/fish/oseary.fish
