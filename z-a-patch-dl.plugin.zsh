# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz :za-patch-dl-handler

@zplg-register-annex "z-a-test" hook:\!atclone \
    :za-patch-dl-handler \
    :za-patch-dl-help-handler \
    "dl''|patch''" # register a new ice-mod: test''

@zplg-register-annex "z-a-test" hook:\!atpull \
    :za-patch-dl-handler \
    :za-patch-dl-help-handler
