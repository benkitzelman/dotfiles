syntax on       " Turn code syntax highlighting on.
set virtualedit=onemore         " Allow for cursor beyond last character.
set history=1000                " Store a ton of history (default is 20).
" set spell                       " Spell checking on.

" UI
set showmode                    " display the current mode
set cursorline                  " highlight current line
hi cursorline guibg=#333333     " highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor
set backspace=indent,eol,start  " backspace for dummys
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms

" Split
set splitbelow
set splitright

" Format
set autoindent                  " indent at the same level of the previous line
set shiftwidth=2                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every four columns
set softtabstop=2               " let backspace delete indent

" Pathogen
execute pathogen#infect()
call pathogen#helptags() "generate helptags for everything in ‘runtimepath’
syntax on
filetype plugin indent on

" NERDTree Mappings
map <C-S-.>     :NERDTree<CR>
map <C-S-Left>  :tabp<CR>
map <C-S-Right> :tabn<CR>
map <C-S-n>     :tabnew<CR>

let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
