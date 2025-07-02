" Modern Vim configuration
" Use vim-plug for plugin management

" Set leader key
let mapleader = "\\"

" Basic settings
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Plugin management with vim-plug
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'tpope/vim-fugitive'                    " Git integration
Plug 'tpope/vim-rails'                       " Rails support
Plug 'tpope/vim-markdown'                    " Markdown support
Plug 'vim-ruby/vim-ruby'                     " Ruby syntax
Plug 'thoughtbot/vim-rspec'                  " RSpec integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder (replaces ctrlp)
Plug 'junegunn/fzf.vim'                      " FZF integration
Plug 'scrooloose/nerdtree'                   " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin'           " Git status in NERDTree
Plug 'rking/ag.vim'                          " Silver searcher
Plug 'tpope/vim-surround'                    " Surround text objects
Plug 'tpope/vim-commentary'                  " Comment/uncomment
Plug 'kshenoy/vim-signature'                 " Show marks
Plug 'vim-airline/vim-airline'               " Status line
Plug 'vim-airline/vim-airline-themes'        " Airline themes
Plug 'dense-analysis/ale'                    " Linting (replaces syntastic)
Plug 'pangloss/vim-javascript'               " JavaScript syntax
Plug 'mxw/vim-jsx'                           " JSX support
Plug 'othree/html5.vim'                      " HTML5 support
Plug 'elixir-lang/vim-elixir'                " Elixir support
Plug 'rust-lang/rust.vim'                    " Rust support
Plug 'aklt/plantuml-syntax'                  " PlantUML syntax

" Color schemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" Enable syntax highlighting and file type detection
syntax on
filetype plugin indent on

" Restore cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Ruby configuration
if has("autocmd")
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
endif

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if has('gui_running')
  set guifont=Inconsolata-dz\ for\ Powerline:h14
endif

" Basic editor settings
set showcmd                    " Show (partial) command in status line
set showmatch                  " Show matching brackets
set ignorecase                 " Case insensitive search
set smartcase                  " Do smart case matching
set incsearch                  " Incremental search
set hlsearch                   " Highlight search results
set autowrite                  " Automatically save before commands
set hidden                     " Hide buffers when abandoned
set mouse=a                    " Enable mouse usage
set title                      " Show filename in title
set fileformat=unix            " Use Unix line endings
set number                     " Show line numbers
set ts=2                       " Tab stop
set shiftwidth=2               " Indent width
set expandtab                  " Use spaces instead of tabs
set visualbell                 " Use visual bell
set wrap                       " Wrap long lines
set linebreak                  " Wrap only on word boundaries
set nolist                     " Don't show invisible characters by default
set ruler                      " Show cursor position
set cursorline                 " Highlight current line
set cursorcolumn               " Highlight current column
set colorcolumn=100            " Show column guide at 100
set formatoptions+=j           " Delete comment char when joining lines
set backspace=indent,eol,start " Allow backspace over everything
set whichwrap+=<,>,h,l         " Allow cursor to wrap
set laststatus=2               " Always show status line
set foldmethod=manual          " Manual folding

" Show invisible characters when toggled
set listchars=tab:▸\ ,eol:¬,trail:-,extends:>,precedes:<,nbsp:+

" Buffer navigation
map <leader>n :bn<CR>
map <leader>p :bp<CR>
map <C-del> :bd<CR>

" Window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" RSpec integration
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

" NERDTree configuration
map <leader>t :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.vim$', '\.pyc$', '\~$', '\.DS_Store$']
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" FZF configuration (replaces ctrlp)
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>g :Ag<CR>

" Clear search highlighting
map <leader>nh :noh<CR>

" Quick escape
inoremap jk <Esc>

" File type specific settings
autocmd FileType make set noexpandtab

" Color scheme
if has('gui_running')
  set background=light
else
  let g:solarized_termcolors=256
  set background=dark
  colorscheme Tomorrow-Night-Eighties
endif

" Backup settings
if filewritable(".") && ! filewritable(".backup")
  silent execute '!umask 002; mkdir .backup'
endif
set backupdir=./.backup,.,/tmp
set directory=./.backup,/tmp

" ALE (linter) configuration
let g:ale_linters = {
\   'ruby': ['rubocop', 'ruby'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['flake8', 'pylint'],
\}

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'python': ['black', 'isort'],
\}

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1

" Highlight Pmenu for better autocomplete
highlight Pmenu ctermbg=238 gui=bold
