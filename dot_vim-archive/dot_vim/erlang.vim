source ~/.vim/programming.vim

map <F5> :make<CR>
imap <F5> <ESC>:w<CR>:make<CR>

setlocal makeprg=erlc\ \"%:p\"

setlocal ts=8
setlocal sw=4
setlocal hlsearch
setlocal comments=:%%\ 
setlocal cinkeys=0%,!^F,o,O
setlocal formatoptions=croql
"setlocal formatoptions+=cranlq
"setlocal formatoptions-=t
setlocal tw=80
setlocal ruler

let b:match_words = '\<fun\>:\<end\>,\<case\>:\<end\>,\<if\>:\<end\>'

let lineNum=search("-module(.*)", "nw")
let line=getline(lineNum)
let startMod=match(line, "(")
let endMod=match(line, ")")
let startAp=match(line, "'", startMod)
if startAp>-1
  let endAp=match(line, "'", startAp+1)
  let g:ModuleName=strpart(line, startAp+1, endAp-startAp-1)
else
  let g:ModuleName=strpart(line, startMod+1, endMod-startMod-1)
endif

function! ErlangTag(var)
  let l:tagName = substitute(a:var, '<cword>\|<cWORD>',
          \ '\=expand(submatch(0))', 'g')
  let l:line=getline(".")
  let l:moduleNamePos=match(l:line, "[a-zA-Z0-9_]*:" . l:tagName)
  if l:moduleNamePos>-1
    let l:moduleNameEnd=match(l:line, ":", l:moduleNamePos)
    let l:moduleName=strpart(l:line, l:moduleNamePos, l:moduleNameEnd-l:moduleNamePos)
  else
    let l:moduleName=g:ModuleName
  endif
  let l:taglist=taglist(l:tagName)
  let l:filteredTags=[]
  for l:item in l:taglist
    if l:item["kind"] == "f" && has_key(l:item, "module")
"      if l:moduleNamePos>-1 && l:item["module"] == l:moduleName && l:item["name"] == l:tagName
"        call add(l:filteredTags, l:item)
"      elseif l:moduleNamePos==-1 && l:item["module"] == g:ModuleName && l:item["name"] == l:tagName
"        call add(l:filteredTags, l:item)
"      endif
      if l:item["module"] == l:moduleName && l:item["name"] == l:tagName
        call add(l:filteredTags, l:item)
      endif
    endif
  endfor
  redir! > /tmp/tags.txt
"  silent echo "  # tag                   file"
  for l:item in l:filteredTags
    silent echo l:item["module"] . ":" . l:item["name"] . l:item["signature"]
    silent echo " " . l:item["cmd"] . " " . l:item["filename"]
  endfor
  redir END
  let l:save_split=&splitbelow
  set splitbelow
  keepjumps new /tmp/tags.txt
  if l:save_split == "off"
    set nosplitbelow
  endif
  return 0
endfunction

command! -nargs=? -complete=tag ErlangTagComm :call ErlangTag(<f-args>)
map <buffer> s :ErlangTagComm <cword><CR>

function! ErlangGetCall(var)
  let l:tagName=expand(a:var)
  let l:searchcmd="/^handle_call({" . l:tagName
  exe l:searchcmd
  nohl
endfunction

command! -nargs=? -complete=tag ErlangGetCallComm :call ErlangGetCall(<f-args>)
map <buffer> <Leader>s :ErlangGetCallComm <cword><CR>

function! ErlangGetFunDef(var)
  let l:tagName=expand(a:var)
  let l:searchcmd="/^\\<" . l:tagName . "\\>"
  exe l:searchcmd
  nohl
endfunction

command! -nargs=? -complete=tag ErlangGetFunDefComm :call ErlangGetFunDef(<f-args>)
map <silent> <buffer> <Leader>* :ErlangGetFunDefComm <cword><CR>

function! ErlangGetVarDef(var)
  call search('^[a-z]', 'b')
"  call search("/\\<" . expand(a:var) . "\\>")
"  call cursor('.', 0)
  let l:searchcmd='/' . expand(a:var) . ''
  exe l:searchcmd
endfunction

function! ErlangGetDef(var)
  let l:defName=expand(a:var)
  let l:firstChar=l:defName[0]
  if l:firstChar == tolower(l:firstChar)
      call ErlangGetFunDef(l:defName)
  else
      call ErlangGetVarDef(l:defName)
  endif
endfunction

command! -nargs=? -complete=tag ErlangGetDefComm :call ErlangGetDef(<f-args>)
map <silent> <buffer> gd :ErlangGetDefComm <cword><CR>

function! s:NETSimErlangFunctionComment(funname)
  let l:funname=expand(a:funname)
  let l:signature=getline('.')
  let l:x=append(line('.')-1, "%%!-------------------------------------------------------------------")
  let l:x=append(line('.')-1, "%% " . l:funname . " -- ")
  let l:x=append(line('.')-1, "%%")
  let l:x=append(line('.')-1, "%% " . l:signature)
  let l:x=append(line('.')-1, "%%--------------------------------------------------------------------")
endfunction

command! -nargs=? -complete=tag NETSimErlangFunctionComment :call <SID>NETSimErlangFunctionComment(<f-args>)
map <silent> <buffer> <Leader>d ?^[a-z]<CR>:NETSimErlangFunctionComm <cword><CR>4k$

"function! s:UploadFile()
"    let l:filename=substitute(expand("%:p"), "/media/sda8/localhome/locanl/", "", "")
"    execute "! $HOME/bin/upload_file.sh " . l:filename
"endfunction
"
"command! -nargs=0 Upload :call <SID>UploadFile()

setlocal keywordprg=man

setlocal errorformat=%f:%l:\ %m

function! s:CheckInfoFile()
  ! ~/bin/check_info_file.sh %:p
endfunction

function! s:NETSimGeneralFileHeader()
  let l:file = resolve (expand("%:t"))
  let l:module = resolve (expand("%:t:r"))
  let l:x=append(line('$'), "%%%!------------------------------------------------------------------")
  let l:x=append(line('$'), "%%% " . l:module . " -- ")
  let l:x=append(line('$'), "%%%")
  let l:x=append(line('$'), "%%% @Copyright:    Copyright (C) " . strftime("%Y") . " Ericsson AB.")
  let l:x=append(line('$'), "%%% @Creator:      Andras Boroska")
  let l:x=append(line('$'), "%%% @Date Created: " . strftime("%Y-%m-%d"))
  let l:x=append(line('$'), "%%% @Description:  ")
  let l:x=append(line('$'), "%%%-------------------------------------------------------------------")
  let l:x=append(line('$'), "-module(" . l:module . ").")
  let l:x=append(line('$'), "-rcs('$Id$').")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "%% Info tags")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "-hdr('').")
  let l:x=append(line('$'), "-txt('').")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "%% API")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "-export([]).")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "%% Internal exports")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "-export([]).")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "%% Include files")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "%% Definitions")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  let l:x=append(line('$'), "%% Records")
  let l:x=append(line('$'), "%%--------------------------------------------------------------------")
  exe ":1d"
endfunction

function! s:NETSimHeaderInfoFile(file)
  echo a:file
  if a:file == ""
    let l:file = resolve (expand("%:t:r"))
  else
    let l:file = resolve (a:file)
  endif
  let l:parts = split(l:file, '\.')
  let l:type = l:parts[0]
  let l:x=append(0, "%% This line tells emacs to use -*- erlang -*- mode")
  let l:x=append(1, "%%")
  let l:x=append(2, "%% Common specifications for the NE type " . l:type)
  let l:x=append(3, "")
  exe ":1d"
endfunction

function! s:NETSimDirMakefile()
  let l:file = resolve (expand("%:t"))
  let l:x=append(line('$'), "# This Makefile runs make in all subdirectories that contain a Makefile.")
  let l:x=append(line('$'), "# Run `make help' to see customization options.")
  let l:x=append(line('$'), "")
  let l:x=append(line('$'), "include ${INCLUDE_MK}/AutoDir.mk")
  exe ":1d"
endfunction

function! s:NETSimEbinMakefile()
  let l:file = resolve (expand("%:t"))
  let l:x=append(line('$'), "include ${INCLUDE_MK}/ErlangDefs.mk")
  let l:x=append(line('$'), "# Run make help in this directory to see what variables you can change here")
  let l:x=append(line('$'), "include ${INCLUDE_MK}/ErlangTargets.mk")
  exe ":1d"
endfunction
command! -nargs=0 Cif :call <SID>CheckInfoFile()
command! Nsfgh   call <SID>NETSimGeneralFileHeader()
command! Nshif   call <SID>NETSimHeaderInfoFile('')
command! Nsdmf   call <SID>NETSimDirMakefile()
command! Nsemf   call <SID>NETSimEbinMakefile()

amenu 60.300 &NETSim.&General\ File\ Header<Tab>:Nsfgh
        \ :Nsfgh<cr>
amenu 60.300 &NETSim.&Header\ Info\ File<Tab>:Nshif
        \ :Nshif<cr>
amenu 60.300 &NETSim.&Dir\ Makefile<Tab>:Nsdmf
        \ :Nsdmf<cr>
amenu 60.300 &NETSim.&Ebin\ Makefile<Tab>:Nsemf
        \ :Nsemf<cr>

"To comment/uncomment
vmap <buffer> <Leader>c :s/^/%/<CR>
vmap <buffer> <Leader>u :s/^%//<CR>>

map <F2> ?^[a-z][A-Za-z0-9_]*(<CR>yw<C-O>$a<CR><ESC>0d$i    io:format("~p:<ESC>p a:~p ~p~n", [?MODULE, ?LINE, self()]),<ESC>
map <F3> lbye$a<CR><ESC>d$i    io:format("~p ~p <ESC>pa: '~p' ~n", [?MODULE, ?LINE, <ESC>pa]),<ESC>==
map <F4> ?^[a-z][A-Za-z0-9_]*(<CR>yw<C-O>$a<CR><TAB>io:format("~p ~p:<ESC>p a:~p ~n", [self(), ?MODULE, ?LINE]),<ESC>==

" Plugin init {{{1
if exists("b:did_ftplugin")
	finish
endif

" Don't load any other
let b:did_ftplugin=1

if exists('s:doneFunctionDefinitions')
	call s:SetErlangOptions()
	finish
endif

let s:doneFunctionDefinitions=1
" }}}

" Local settings {{{1
" Run Erlang make instead of GNU Make
function s:SetErlangOptions()
"	compiler erlang
	setlocal omnifunc=erlangcomplete#Complete

	" {{{2 Settings for folding
	if (!exists("g:erlangFold")) || g:erlangFold
		setlocal foldmethod=expr
		setlocal foldexpr=GetErlangFold(v:lnum)
		setlocal foldtext=ErlangFoldText()
		"setlocal fml=2
	endif
endfunction

" Define folding functions {{{1
if !exists("*GetErlangFold")
	" Folding params {{{2
	" FIXME: Could these be shared between scripts?
	let s:ErlangFunEnd      = '^[^%]*\.\s*\(%.*\)\?$'
	let s:ErlangFunHead     = '^\a\w*(.*)\(\s+when\s+.*\)\?\s\+->\s*$'
	let s:ErlangBeginHead   = '^\a\w*(.*$'
	let s:ErlangEndHead     = '^\s\+[a-zA-Z-_{}\[\], ]\+)\(\s+when\s+.*\)\?\s\+->\s\(%.*\)\?*$'
	let s:ErlangBlankLine   = '^\s*\(%.*\)\?$'

	" Auxiliary fold functions {{{2 
	function s:GetNextNonBlank(lnum)
		let lnum = nextnonblank(a:lnum + 1)
		let line = getline(lnum)
		while line =~ s:ErlangBlankLine && 0 != lnum
			let lnum = nextnonblank(lnum + 1)
			let line = getline(lnum)
	   endwhile
	   return lnum
	endfunction

	function s:GetFunName(str)
		return matchstr(a:str, '^\a\w*(\@=')
	endfunction

	function s:GetFunArgs(str, lnum)
		let str = a:str
		let lnum = a:lnum
		while str !~ '->\s*\(%.*\)\?$'
			let lnum = s:GetNextNonBlank(lnum)
			if 0 == lnum " EOF
				return ""
			endif
			let str .= getline(lnum)
		endwhile
		return matchstr(str, 
			\ '\(^(\s*\)\@<=.*\(\s*)\(\s\+when\s\+.*\)\?\s\+->\s*\(%.*\)\?$\)\@=')
	endfunction

	function s:CountFunArgs(arguments)
		let pos = 0
		let ac = 0 " arg count
		let arguments = a:arguments
		
		" Change list / tuples into just one A(rgument)
		let erlangTuple = '{\([A-Za-z_,|=\-\[\]]\|\s\)*}'
		let erlangList  = '\[\([A-Za-z_,|=\-{}]\|\s\)*\]'

		" FIXME: Use searchpair?
		while arguments =~ erlangTuple
			let arguments = substitute(arguments, erlangTuple, "A", "g")
		endwhile
		" FIXME: Use searchpair?
		while arguments =~ erlangList
			let arguments = substitute(arguments, erlangList, "A", "g")
		endwhile
		
		let len = strlen(arguments)
		while pos < len && pos > -1
			let ac += 1
			let pos = matchend(arguments, ',\s*', pos)
		endwhile
		return ac
	endfunction

	" Main fold function {{{2
	function GetErlangFold(lnum)
		let lnum = a:lnum
		let line = getline(lnum)

		" Function head gives fold level 1 {{{3
		if line=~ s:ErlangBeginHead
			while line !~ s:ErlangEndHead
				if 0 == lnum " EOF / BOF
					retun '='
				endif
				if line =~ s:ErlangFunEnd
					return '='
				endif
				endif
				let lnum = s:GetNextNonBlank(lnum)
				let line = getline(lnum)
			endwhile 
			" check if prev line was really end of function
			let lnum = s:GetPrevNonBlank(a:lnum)
			if exists("g:erlangFoldSplitFunction") && g:erlangFoldSplitFunction
				if getline(lnum) !~ s:ErlangFunEnd
					return '='
				endif
			endif
			return '1>'
		endif

		" End of function (only on . not ;) gives fold level 0 {{{3
		if line =~ s:ErlangFunEnd
			return '<1'
		endif

		" Check if line below is a new function head {{{3
		" Only used if we want to split folds for different function heads
		" Ignores blank lines
		if exists("g:erlangFoldSplitFunction") && g:erlangFoldSplitFunction
			let lnum = s:GetNextNonBlank(lnum)

			if 0 == lnum " EOF
				return '<1'
			endif

			let line = getline(lnum)

			" End of prev function head (new function here), ending fold level 1
			if line =~ s:ErlangFunHead || line =~ s:ErlangBeginHead
				return '<1'
			endif
		endif
		
		" Otherwise use fold from previous line
		return '='
	endfunction

	" Erlang fold description (foldtext function) {{{2
	function ErlangFoldText()
		let foldlen = v:foldend - v:foldstart
		if 1 < foldlen
			let lines = "lines"
		else
			let lines = "line"
		endif
		let line = getline(v:foldstart)
		let name = s:GetFunName(line)
		let arguments = s:GetFunArgs(strpart(line, strlen(name)), v:foldstart)
		let argcount = s:CountFunArgs(arguments)
		let retval = v:folddashes . " " . name . "/" . argcount
		let retval .= " (" . foldlen . " " . lines . ")"
		return retval
	endfunction " }}}
endif " }}}

call s:SetErlangOptions()


