__call_precmds() {
  type precmd > /dev/null 2>&1 && precmd
  for __pre_func in $precmd_functions; do $__pre_func; done
}

__cd_up()   { builtin pushd ..; }
__cd_undo() { builtin popd; }
zle -N __cd_up;   bindkey '^q' __cd_up
zle -N __cd_undo; bindkey '^s' __cd_undo

