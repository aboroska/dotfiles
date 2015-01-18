syntax clear
syn match rcomment "^#.*$"
syn match rcommand  "^\(CMD\|CPR\|CMI\|EMD\|ETC\):.*$"
syn match ranswer   "^\(APR\|AMD\|APE\|AMD\|ERR\|SFO\|SFI\|SPR\|RPR\|RPE\|STS\):.*$"
syn match rtrace    "^\(INC\|TRC\|TRE\):.*$"
highlight link rcomment Comment
highlight link rcommand Statement
highlight link ranswer Identifier
highlight link rtrace Macro
