# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz :za-patch-dl-handler

# An empty stub to fill the help handler fields
:za-patch-dl-help-null-handler() { :; }

# Register !atclone hook
@zinit-register-annex "z-a-patch-dl" hook:\!atclone \
    :za-patch-dl-handler \
    :za-patch-dl-help-null-handler \
    "dl''|patch''" # register a new ice-mod: test''

# Register !atpull hook
@zinit-register-annex "z-a-patch-dl" hook:\!atpull \
    :za-patch-dl-handler \
    :za-patch-dl-help-null-handler
