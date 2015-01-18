" NETSim-specific tag file setup

let dirname=expand("%:p")
if (match(dirname, "/var/tmp/eanboro/cvscheckout/")>-1) || (match(dirname, "/proj/netsimproj/eanboro/cvscheckout/")>-1) || (match(dirname, "/home/eanboro/cvscheckout/")>-1)
    setlocal tags=/home/eanboro/cvscheckout/tags,$ERLANGINST/tags
elseif (match(dirname, "/proj/netsimproj/auto-cvscheckout")>-1) || (match(dirname, "/proj/netsimproj/otpr1...inst/linux")>-1)
    setlocal tags=/home/eanboro/cvscheckout/tags,/home/eanboro/autocvs.tags,$ERLANGINST/tags
    setlocal readonly
    setlocal noswapfile
endif
