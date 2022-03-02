:set encoding=utf-8
:set mouse=a 				" Enable mouse
:set tabstop=4 				" 
:set shiftwidth=4 			" 
:set listchars=tab:\¦\ 		" Tab charactor 
:set list
:set foldmethod=indent 		" 
:set foldlevelstart=99 		"  
:set number 					" Show line number
:set ignorecase 				" Enable case-sensitive 
cnoremap W execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"cnoremap -bar W exe ':silent w !sudo tee % > /dev/null %:p:S' | setl nomod
" Disable backup
:set nobackup
:set nowb
:set autoindent
:set fileformat=unix
:set expandtab
:set noswapfile
:set runtimepath+=~/.local/nvim/site/autoload/plug.vim 
syntax on

" Resize pane
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>
nnoremap <C-J> <C-W><C-J> #di chuyen den phan tach ben duoi
nnoremap <C-K> <C-W><C-K> # di chuyen den phan tach ben tren
nnoremap <C-L> <C-W><C-L> # di chuyen den phan tach ben phai
nnoremap <C-H> <C-W><C-H> # di chuyen den phan tach ben trai
" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime



call plug#begin('~/.local/share/nvim/site/autoload/plugged')
"call plug#begin(stdpath('config') . '/plugged')

" Better Syntax Support
    Plug 'sheerun/vim-polyglot'

  " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    "Theme
	Plug 'morhetz/gruvbox'
		
    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Or build from source code by using yarn: https://yarnpkg.com
   "Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	"File Brower
    Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ryanoasis/vim-webdevicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    
    " Status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

    "File Search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    "Snips
    Plug 'sirver/ultisnips'

    "Terminal float
    Plug 'voldikss/vim-floaterm'

call plug#end()

"browser file
"map <silent> <F5> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"Set copy/paste to clipboard
set clipboard+=unnamedplus
"Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let NERDTreeMapOpenInTab='<ENTER>'
let python_highlight_all=1
:set cursorline
nnoremap <SPACE> <Nop>
":let mapleader=" "

"Set leader key
nmap <leader> :map <leader> <CR>
"set font
set guifont=Droid\Sans\Mono\for\Powerline\Plus\Nerd\File\Types\12
"g: webdevicons_enable
"set colorscheme
let g:airline_powerline_fonts=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_transparent_bg=1
set bg=dark
autocmd VimEnter * hi Normal ctermbg=none
colorscheme gruvbox

"open NERDTree auto
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists ("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType python map <silent> <buffer> <F9> :w<CR>:exec 'FloatermNew python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <silent> <buffer> <F9> <esc>:w<CR>:exec 'FloatermNew python3' shellescape(@%, 1)<CR>

autocmd FileType c map <silent> <buffer> <F9> :w<CR>:exec 'FloatermNew gcc -o' shellescape('%:r') shellescape(@%, 1)<CR>
autocmd FileType c imap <silent> <buffer> <F9> <esc> :w<CR>:exec 'FloatermNew gcc -o' shellescape('%:r') shellescape(@%, 1)<CR>

autocmd FileType java map <silent> <buffer> <F9> :w<CR>:exec 'FloatermNew javac' shellescape(@%, 1)<CR>
autocmd FileType java imap <silent> <buffer> <F9> <esc>:w<CR>:exec 'FloatermNew javac' shellescape(@%, 1)<CR>
autocmd FileType java map <silent> <buffer> <F9> :w<CR>:exec 'FloatermNew java' shellescape(@%, 1)<CR>
autocmd FileType java imap <silent> <buffer> <F9> <esc>:w<CR>:exec 'FloatermNew java' shellescape(@%, 1)<CR>
"Setings
for f in split(glob('~/.config/nvim/settings/*.nvim'))
	exe 'source' f
endfor


