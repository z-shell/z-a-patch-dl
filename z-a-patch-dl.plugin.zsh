# According to the Zsh Plugin Standard:
# https://z.digitalclouds.dev/community/zsh_plugin_standard/#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]] {
    fpath+=( "${0:h}/functions" )
}

# https://z.digitalclouds.dev/community/zsh_plugin_standard/#the-proposed-function-name-prefixes
autoload -Uz →za-patch-dl-handler

# An empty stub to fill the help handler fields
→za-patch-dl-help-null-handler() { :; }

# Register !atclone hook
@zi-register-annex "z-a-patch-dl" hook:\!atclone-20 \
  →za-patch-dl-handler \
  →za-patch-dl-help-null-handler "dl''|patch''" # register a new ice-mod: dl'', patch''

# Register !atpull hook
@zi-register-annex "z-a-patch-dl" hook:\!atpull-20 \
  →za-patch-dl-handler \
  →za-patch-dl-help-null-handler

# vim: ft=zsh sw=2 ts=2 et
