"  Find files in ~cvscheckout

let g:ackprg="!grep "

function! F(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    let &grepprg = g:ackprg
    "execute "silent! grep " . a:args . " /home/ecsahoc/c/files.txt | sed \'s+^\.+/home/eanboro/cvscheckout+\'"
    execute "silent! grep " . a:args . " /home/ecsahoc/c/files.txt"
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

command! -nargs=* -complete=file F call F(<q-args>)
