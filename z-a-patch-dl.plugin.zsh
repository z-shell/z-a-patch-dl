#  ============================================================================  #
#  [ https://github.com/z-shell ] ❮ ZI ❯         [ (c) 2022 Z-SHELL COMMUNITY ] #
#  ============================================================================  #
#
# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# According to the Zsh Plugin Standard:
# https://wiki.zshell.dev/community/zsh_plugin_standard/#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]] {
    fpath+=( "${0:h}/functions" )
}

# https://wiki.zshell.dev/community/zsh_plugin_standard/#the-proposed-function-name-prefixes
autoload -Uz .z-a-patch-dl-download-file-stdout →za-patch-dl-handler

# An empty stub to fill the help handler fields
→za-patch-dl-null-handler() { :; }

# Register !atclone hook
@zi-register-annex "z-a-patch-dl" hook:\!atclone-20 \
  →za-patch-dl-handler \
  →za-patch-dl-null-handler "dl''|patch''" # register a new ice-mod: dl'', patch''

# Register !atpull hook
@zi-register-annex "z-a-patch-dl" hook:\!atpull-20 \
  →za-patch-dl-handler \
  →za-patch-dl-null-handler
