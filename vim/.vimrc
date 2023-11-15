
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim/'}
Plugin 'davidhalter/jedi-vim'
" Plugin 'zchee/deoplete-jedi'
Plugin 'dense-analysis/ale'
Plugin 'ekalinin/Dockerfile.vim'
" Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ctrl p
" let g:ctrlp_working_path_mode=''

" export FZF_DEFAULT_COMMAND='ag --ignore "unused-code/*" -g ""'
"nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :<C-u>Files<CR>
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co - exclude-standard', 'find %s -type f']
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\vunused-code\/',
"   \ 'link': 'peritus',
"   \ }
set wildignore=*.pyc,*.pkl

"The former line ensures that the autocomplete window goes away when you’re done with it, and the latter defines a shortcut for goto definition.
" let g:ycm_autoclose_preview_window_after_completion=1
" My leader key is mapped to space, so space-g will goto definition of whatever I’m currently on. Helpful when exploring new code.
" map <>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ set fileformat=unix |

let g:go_fmt_command = "gofmt"
" let g:go_fmt_autosave = 0

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start

set encoding=utf-8
set nu

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
let g:airline_powerline_fonts = 1

set laststatus=2
set hlsearch

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" nerdtree
map <C-n> :NERDTreeToggle<CR>"

" f5 toggles buffer list with numbers. press the number for file
:nnoremap <F5> :buffers<CR>:buffer<Space>

" toggle nerdtree automatically
" autocmd vimenter * NERDTree

" To use the mapping, visually select the characters that are wanted in the search, then type // to search for the next occurrence of the selected text. Then press n to search for the next occurrence.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" map <leader>b <oimport ipdb; ipdb.set_trace()>
" map <F2> :echo 'Current time is ' . strftime('%c')<CR>
