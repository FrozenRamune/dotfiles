eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

function zcompiled_source {
  ensure_zcompiled $1
  builtin source $1
}
function ensure_zcompiled {
  local compiled="$1.zwc"
  if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
    echo "Compiling $1"
    zcompile $1
  fi
}

ZSHRC_DIR=${${(%):-%N}:A:h}

export ZENO_HOME="$ZSHRC_DIR/zeno"

export SHELDON_CONFIG_DIR="$ZSHRC_DIR/sheldon"
sheldon_cache="$SHELDON_CONFIG_DIR/sheldon_cache.zsh"
sheldon_toml="$SHELDON_CONFIG_DIR/plugins.toml"
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  sheldon source > $sheldon_cache
fi
zcompiled_source "$sheldon_cache"
unset sheldon_cache sheldon_toml
