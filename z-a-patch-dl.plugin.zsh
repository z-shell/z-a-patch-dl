# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz :zp-patch-dl-handler

@zplg-register-annex "z-a-test" hook:\!atclone \
    :zp-patch-dl-handler \
    :zp-patch-dl-help-handler \
    "dl''|patch''" # register a new ice-mod: test''

@zplg-register-annex "z-a-test" hook:\!atpull \
    :zp-patch-dl-handler \
    :zp-patch-dl-help-handler
