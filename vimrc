
" set autochdir
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set autoindent
set cindent
set noswapfile
set nobackup

set nowrap

"���������������
let &termencoding=&encoding
set fileencodings=utf-8,gbk

nmap fn :let @+ =expand("%")
nmap cd :let @+ =expand("%:p")
nmap sn :let @+ =expand("%:t")

colorscheme zellner 

