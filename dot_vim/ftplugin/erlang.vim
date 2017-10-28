"source ~/.vim/programming.vim

map <F5> :make<CR>
imap <F5> <ESC>:w<CR>:make<CR>
map <F3> <ESC>yawoio:format("~p ~p <ESC>pa: ~p~n", [?MODULE, ?LINE, <ESC>pa]),<ESC>==
map <F4> <ESC>yawoct:pal("~p ~p <ESC>pa: ~p~n", [?MODULE, ?LINE, <ESC>pa]),<ESC>==

"setlocal makeprg=/Users/aboroska/otpinst/latest/bin/erlc\ \"%:p\"

setlocal ts=8
setlocal sw=2
"setlocal hlsearch
setlocal comments=:%%\ 
setlocal cinkeys=0%,!^F,o,O
setlocal formatoptions=croqlt
"setlocal formatoptions+=cranlq
"setlocal formatoptions-=t
setlocal tw=84
"setlocal ruler

let b:match_words = '\<fun\>:\<end\>,\<case\>:\<end\>,\<if\>:\<end\>'


"To comment/uncomment
vmap <buffer> <Leader>c :s/^/%%/<CR>
vmap <buffer> <Leader>u :s/^%%//<CR>>

" Plugin init {{{1
if exists("b:did_ftplugin")
	finish
endif

" Don't load any other
let b:did_ftplugin=1
