# According to the Zsh Plugin Standard:
# https://github.com/z-shell/zi/wiki/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz za-patch-dl-handler

# An empty stub to fill the help handler fields
za-patch-dl-help-null-handler() { :; }

# Register !atclone hook
@zi-register-annex "z-a-patch-dl" hook:\!atclone-20 za-patch-dl-handler za-patch-dl-help-null-handler "dl''|patch''" # register a new ice-mod: test''

# Register !atpull hook
@zi-register-annex "z-a-patch-dl" hook:\!atpull-20 za-patch-dl-handler za-patch-dl-help-null-handler
