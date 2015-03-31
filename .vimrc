set nocp
set title
set number
set lines=200 columns=80

set tabstop=2
set shiftwidth=2
set expandtab
set shiftround
set nowrap

autocmd FileType make setlocal noexpandtab shiftwidth=8

set clipboard=unnamedplus

set ignorecase
set smartcase
set incsearch

set backspace=indent,eol,start

syntax enable

set autochdir 
colorscheme darkblue
"good colorschemes: blue, darkblue, desert, 
"elflord, evening, koehler, murphy, pablo, ron, slate,
"torte
"
""badd colorschemes: default, morning, peachpuff, shine
set background=dark
inoremap <C-S> <Esc>:w<CR>    
nnoremap <C-S> :w<CR> 
set cursorline 

"set backupdir=/tmp/.backup 
"set directory=/tmp/.backup
set nobackup
set noswapfile

set switchbuf=useopen

nmap W w!

highlight Overflow guibg=red guifg=white
autocmd FileType c,cc,cpp,h,hh,hpp,ipp,python match Overflow /\%82v.*/

highlight Normal guibg=black
highlight Normal ctermbg=black
