set comments=:#
set formatoptions+=cra
set formatoptions-=t
set fileencoding=latin1 " to handle pound signs properly

source ~/.vim/netsim.vim

"Do not format the comments
setlocal formatoptions=croql

"setlocal tags=/home/eanboro/cvscheckout/tags,/home/eanboro/autocvs.tags,/proj/netsimproj/otpr13bginst/tags

"setlocal makeprg=/media/sda8/localhome/locanl/bin/run_test.sh\ %:p

"vmap <buffer> <Leader>c :s/^/#/<CR>:nohl<CR>
"vmap <buffer> <Leader>u :s/^#//<CR>:nohl<CR>
vmap <buffer> <Leader>c :s/^/#/<CR>>
vmap <buffer> <Leader>u :s/^#//<CR>>

function! s:OpenFile(ext)
"    let l:filename="/home/eanboro/netsimdir/dailybuild/" . expand("%:r") . a:ext
    let l:filename=$NETSIMDIR . "/dailybuild/" . expand("%:r") . a:ext
    tabedit `=l:filename`
endfunction

function! s:RawTemplate()
    for l:line in readfile("/home/eanboro/netsim/mml_template.raw")
        let l:x=append(line('$'), l:line)
    endfor
endfunction

function! s:UploadFile()
    let l:filename=substitute(expand("%:p"), "/home/eanboro/", "", "")
    execute "! $HOME/bin/upload_file.sh " . l:filename
endfunction

command! -nargs=0 Upload :call <SID>UploadFile()
command! -buffer Orepdiff call <SID>OpenFile('.reportdiff')
command! -buffer Orep call <SID>OpenFile('.report')
command! -buffer Ores call <SID>OpenFile('.res')
command! -buffer RawT call <SID>RawTemplate()
"command! -buffer Run !/media/sda8/localhome/locanl/bin/run_test.sh %:p >/dev/null 2>&1 &
"command! -buffer Run !/home/eanboro/bin/run_test.sh %:p >/dev/null &
command! -buffer Run !/home/eanboro/bin/run_test.sh %:p

amenu 70.300 &RawFile.Open\ Report&Diff<Tab>:Orepdiff :Orepdiff<cr>
amenu 70.300 &RawFile.Open\ Re&port<Tab>:Orep :Orep<cr>
amenu 70.300 &RawFile.Open\ Re&sult<Tab>:Ores :Ores<cr>
amenu 70.300 &RawFile.&Run\ Test<Tab>:Run :Run<cr>
amenu 70.300 &RawFile.Raw\ &Template<Tab>:RawT :RawT<cr>

