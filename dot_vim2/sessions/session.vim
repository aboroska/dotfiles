let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <D-BS> 
imap <M-BS> 
imap <M-Down> }
inoremap <D-Down> <C-End>
imap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
imap <S-Tab> 
inoremap <C-Tab> 	
map! <D-v> *
nmap  :b#
nnoremap <silent>  :CtrlP
noremap   :
nnoremap * *
nnoremap <silent> ,b :CommandTBuffer
noremap ,:: :call Underline(":")
noremap ,'' :call Underline("'")
noremap ,"" :call Underline('"')
noremap ,^^ :call Underline('^')
noremap ,== :call Underline('=')
noremap ,-- :call Underline('-')
nnoremap ,s ^vg_y:execute @@:echo 'Sourced line.'
vnoremap ,s y:execute @@:echo 'Sourced selection.'
nnoremap ,, 
map ,F :CommandTFlush|:CommandT %%
map ,f :CommandTFlush|:CommandT
vnoremap / /\v
nnoremap / /\v
noremap H ^
vnoremap L g_
nnoremap L $
onoremap L $
noremap Q <Nop>
xmap S <Plug>VSurround
vmap [% [%m'gv``
nmap \\u <Plug>CommentaryUndo
nmap \\\ <Plug>CommentaryLine
nmap \\ <Plug>Commentary
xmap \\ <Plug>Commentary
nnoremap <silent> \gwin :GWindow
vmap ]% ]%m'gv``
vmap a% [%v]%
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
nmap gcu <Plug>CommentaryUndo
nmap gcc <Plug>CommentaryLine
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
xmap gS <Plug>VgSurround
map h1 yypVr=o
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
map <M-Down> }
noremap <D-Down> <C-End>
map <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <C-Right> 5>
nnoremap <C-Left> 5<
vmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
imap S <Plug>ISurround
imap s <Plug>Isurround
imap 	 
imap  <Plug>Isurround
inoremap  mzgUiw`za
imap  =CtrlXPP()
cnoremap %% =expand('%:h').'/'
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set commentstring=%\ %s
set diffopt=filler,iwhite
set directory=~/.vimswap//,/tmp//,.
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guioptions=egmrLt
set guitablabel=%M%t
set helplang=en
set hlsearch
set incsearch
set langmenu=none
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set ruler
set runtimepath=~/.vim/bundle/ctrlp.vim,~/.vim,~/.vim/bundle/ack.vim,~/.vim/bundle/snipMate,~/.vim/bundle/vim-commentary,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,~/.vim/after
set shiftwidth=4
set showbreak=â€¦
set smarttab
set softtabstop=4
set spelllang=en,de,hu
set termencoding=utf-8
set visualbell
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Downloads/qc_CourseExercises/PositiveNegativeTesting
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 queue_eqc.erl
badd +35 time_of_day.erl
badd +47 ~/Downloads/qc_CourseExercises/TestingFiniteStateMachines/locker_eqc.erl
args queue_eqc.erl
edit queue_eqc.erl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
inoremap <buffer> \> >
inoremap <buffer> \. >
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=%\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'erlang'
setlocal filetype=erlang
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=ErlangIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=after,=end,=catch,=),=],=}
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en,de,hu
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'erlang'
setlocal syntax=erlang
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 40 - ((20 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 0
lcd ~/Downloads/qc_CourseExercises/PositiveNegativeTesting
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
