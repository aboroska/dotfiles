:syntax clear
:syn match moduleName "^[^:]*"
:syn region tagName start=":" end=" "
:highlight link moduleName Label
:highlight link tagName Identifier
:set nowrap
