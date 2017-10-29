set wrapmargin=4
set shiftwidth=4
set tabstop=4
set expandtab

"set formatoptions+=tcqb2n
"set formatoptions-=ro
set cindent
set cinoptions=g0,(0,u0,w0
set cinkeys=0{,0},:,0#,!^F,o,O
set comments=sr:/*,mb:*,el:*/,://

set autowrite
set showmatch
set showmode
set ruler

"inoremap <Tab> <C-p>

fun! ToggleFold() 
  if foldlevel('.') == 0 
    normal! l 
  else 
    if foldclosed('.') < 0 
      . foldclose 
    else 
      . foldopen 
    endif 
  endif 
  " Clear status line 
  echo 
endfun 

"noremap <space> :call ToggleFold()<CR>
noremap <leader>m :call ToggleFold()<CR>

" folds are open by default, toggle: zi
set nofoldenable
