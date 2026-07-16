" This is Gary Bernhardt's .vimrc file but edited by Hugh Haworth
" vim:set ts=2 sts=2 sw=2 expandtab:

" remove all existing autocmds
autocmd!

" True color mode! (Requires a fancy modern terminal, but iTerm works.)
:set termguicolors

" initialize plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
" Plug 'zivyangll/git-blame.vim'
Plug 'romainl/vim-cool'

" JavaScript
" Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" TypeScript highlighting/indent
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'ianks/vim-tsx'

" TypeScript semantic support
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'

" Color schemes
"Plug 'jonathanfilip/vim-lucius'
Plug 'dracula/vim', { 'as': 'dracula' }

"fzf
"
" also need to install fzf and ripgrep.
" In brew:
" brew install fzf
" brew install ripgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"git stuff
Plug 'airblade/vim-gitgutter'

"tab autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme dracula

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
" Always show tab bar at the top
set showtabline=2
set winwidth=79
" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1
" Stop SQL language files from doing unholy things to the C-c key
let g:omni_sql_no_default_maps = 1
" Diffs are shown side-by-side not above/below
set diffopt=vertical
" Always show the sign column
"set signcolumn=no

" Write swap files to disk and trigger CursorHold event faster (default is
" after 4000 ms of inactivity)
:set updatetime=200
" Completion options.
"   menu: use a popup menu
"   preview: show more info in menu
:set completeopt=menu,preview
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Use persistent undo history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-RUBY CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do this:
"   first
"     .second do |x|
"       something
"     end
" Not this:
"   first
"     .second do |x|
"     something
"   end
:let g:ruby_indent_block_style = 'do'
" Do this:
"     x = if condition
"       something
"     end
" Not this:
"     x = if condition
"           something
"         end
:let g:ruby_indent_assignment_style = 'variable'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hugh Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard=unnamed
:set wrap!                     " I'm tired of line wraps yo!

" From Primagen hehe:
:nnoremap <C-d> <C-d>zz
:nnoremap <C-u> <C-u>zz

nnoremap <C-p> <cmd>:Files<cr>
nnoremap <C-f> <cmd>:RG<cr>
nnoremap <silent> <leader>. :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

nnoremap <silent> <leader>o :vsplit<CR><C-w>l:Files<CR>

noremap <silent> <C-S>          :w!<CR>
inoremap <silent> <C-S>         <C-O>:w!<CR>

nnoremap <silent> <leader>m :let @*=expand('%')<cr>

function! RubocopFormat() abort
  silent !rubocop -A %
  edit!
  redraw!
endfunction

augroup RubocopAutoFormat
  autocmd!
  autocmd BufWritePost *.rb call RubocopFormat()
augroup END


function! PrettierFormat() abort
  silent !npx prettier --write %
  edit!
  redraw!
endfunction

augroup PrettierAutoFormat
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx call PrettierFormat()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rip grep in a directory:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Define a new command, :RGSrc, to search the 'src/' subdirectory
command! -nargs=? RGSrc
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always ' . fzf#shellescape(<q-args>) . ' src/',
  \   1,
  \   <bang>0
  \ )
" Define a new command, :RGDir, that takes two arguments:
" <q-args> will capture the entire argument string (Pattern and Dir)
command! -nargs=+ RGDir
  \   call fzf#vim#grep2(
  \     "rg --column --line-number --no-heading --color=always -g \'" . <q-args> . "\/**' ",
  \     1,
  \     <bang>0
  \   ) |

function! RgDirPrompt()

    let l:dir_path = input("Search Dir (e.g. src/utils): ")

    let l:command = 'RGDir ' .  l:dir_path

    execute l:command
endfunction

nnoremap <silent> <leader>f <cmd>:call RgDirPrompt()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enter completion config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enter accepts
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Tab and Shift+Tab to cycle through buffers seamlessly
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
