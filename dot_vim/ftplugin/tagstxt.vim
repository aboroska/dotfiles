function! SelectTag()
  let l:line=getline(".")
  if match(l:line, "^[a-z]") > -1
    let l:cursorpos=getpos(".")
    let l:cursorpos[1]=l:cursorpos[1]+1
    call setpos(".", l:cursorpos)
    let l:line=getline(".")
  endif
  let l:filename=matchstr(l:line, " [^ ]*$")
  let l:cmd=matchstr(l:line, " /\^.*\$/")
  let l:searchcmd=l:cmd[1:]
  let l:searchcmd=l:searchcmd[:-2]
"  let l:tagPathEnd=match(&tags, "/tags")
"  let l:tagPath=strpart(&tags, 0, l:tagPathEnd)
"  let l:path=l:tagPath . "/" . l:filename[1:-1]
"  echo "'" . l:searchcmd . "'"
"  echo l:path
  let l:path=l:filename[1:-1]
  edit! `=l:path`
"  let l:jumpcommand = "keepjumps normal " . l:searchcmd
"  exe l:jumpcommand
  exe l:searchcmd
  wincmd k
  hide
endfunction

map <buffer> <CR> :call SelectTag()<CR>

