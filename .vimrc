set nocompatible              

filetype off                  " required
call plug#begin('~/.vim/plugged')
		Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
		Plug 'lervag/vimtex'
		Plug 'lambdalisue/suda.vim' 
		Plug 'tpope/vim-commentary'
		if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
 		Plug 'itchyny/lightline.vim'
		" Plug 'deoplete-plugins/deoplete-jedi'
		Plug 'vimwiki/vimwiki'
		Plug 'wakatime/vim-wakatime'
		Plug 'michaeljsmith/vim-indent-object'
		Plug 'Yggdroot/indentLine'
		Plug 'Shougo/context_filetype.vim'
		Plug 'jeetsukumaran/vim-indentwise'
		Plug 'neomake/neomake'
		Plug 'ryanoasis/vim-devicons'
		Plug 'https://github.com/dracula/vim'
		Plug 'rakr/vim-one'
		Plug 'SirVer/ultisnips'
		Plug 'honza/vim-snippets'
		Plug 'scrooloose/nerdtree'
		Plug 'Townk/vim-autoclose'
		Plug 'godlygeek/tabular'
		Plug 'plasticboy/vim-markdown'
		" Plugin 'https://github.com/etdev/vim-hexcolor.git'
		Plug 'https://github.com/lilydjwg/colorizer.git'
		Plug 'Chiel92/vim-autoformat'
		" Plugin 'artur-shaik/vim-javacomplete2'
		" CODE FORMAT
		" Add maktaba and codefmt to the runtimepath.
		" (The latter must be installed before it can be used.)
		Plug 'google/vim-maktaba'
		Plug 'google/vim-codefmt'
		" Also add Glaive, which is used to configure codefmt's maktaba flags. See
		" `:help :Glaive` for usage.
		Plug 'google/vim-glaive'
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'ferrine/md-img-paste.vim'
		" Plugin 'vim-pandoc/vim-pandoc'
		" Plugin 'vim-pandoc/vim-pandoc-syntax' 
		" Plugin 'iamcco/markdown-preview.nvim'
		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
		Plug 'sheerun/vim-polyglot'
		" Plugin 'w0rp/ale'
		Plug 'tpope/vim-surround'
		Plug 'bkad/CamelCaseMotion'
		" Plugin 'vim-scripts/marvim'
		" Plugin 'vim-syntastic/syntastic'
		Plug 'gyim/vim-boxdraw'
		Plug 'joom/turkish-deasciifier.vim'
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		" Plug 'junegunn/fzf.vim'
		" Plug 'fisadev/FixedTaskList.vim'
		Plug 'KeitaNakamura/tex-conceal.vim'
		Plug 'dart-lang/dart-vim-plugin'
		Plug 'frazrepo/vim-rainbow'
call plug#end()

call glaive#Install()
let mapleader=" "
filetype plugin indent on    
syntax on
set tabstop=2
set laststatus=2
set shiftwidth=2
set autoindent
set showcmd
set number relativenumber
set ignorecase
set smartcase
set grepprg=grep\ -nH\ $*
set incsearch
set hlsearch
set noswapfile

filetype on
filetype plugin on

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

" au FileType php setl ofu=phpcomplete#CompletePHP
" au FileType ruby,eruby setl ofu=rubycomplete#Complete
" au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
" au FileType c setl ofu=ccomplete#CompleteCpp
" au FileType cpp setl ofu=ccomplete#CompleteCpp
" au FileType css setl ofu=csscomplete#CompleteCSS

syntax enable

compiler gcc

color dracula

"{{{ Open URL in browser
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction
"}}}

command! W write
command! Q quit

set scrolloff=10

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

set clipboard=unnamed

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" split
set winheight=30
" set winminheight=5

" nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

set foldmethod=syntax
" set foldmethod=manual

" execute pathogen#infect()
" let g:airline_powerline_fonts = 1

" calcurse markdown
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
set background=dark

" spell check 
map <F8> :setlocal spell! spelllang=en<CR>
map <F9> :set spelllang=tr<CR>

" autocompile
" autocmd BufWritePost hw.cpp !make
autocmd BufWritePost ~/.Xresources !xrdb ~/.Xresources

autocmd BufWritePost,FileWritePost *.dot :silent !dot -Tpng % -o %:r.png
" autocmd BufWritePost,FileWritePost *.dot !dot % | gvpr -c -f ~/scripts/tree.gv | neato -n -Tpng -o %:r.png

" terminal esc simulation
tnoremap <Esc> <C-\><C-n>

"auto format google
" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer yapf
"   " Alternative: autocmd FileType python AutoFormatBuffer autopep8
"   autocmd FileType vue AutoFormatBuffer prettier
" augroup END

"GOYO
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"Markdown Prewiev
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

let g:gruvbox_italic=1

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>


" compile c++ cpp
" autocmd BufWritePost *.cpp !g++ -o  %:r.out % -std=c++11
" nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
" nnoremap <C-x> :!./%:r.out<Enter>
" nnoremap <A-x> :!g++ -o  %:r.out % -std=c++11<Enter> :!./%:r.out<Enter>

set wildmenu
set hidden
set path+=**
set wildignore+=**/node_modules/**

" let g:dracula_colorterm = 0
set termguicolors

au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

set cursorline

" markdown macros
" code
autocmd FileType markdown map <silent> <leader>C i```java<Enter><Enter>```<Esc>ki
autocmd FileType markdown map <silent> <leader>c ysiw`ww
" bold
autocmd FileType markdown map <silent> <leader>b ysiw*lysiw*ww
autocmd FileType markdown map <silent> <leader>B yss*lyss*
" italic
autocmd FileType markdown map <silent> <leader>i ysiw*ww
autocmd FileType markdown map <silent> <leader>I yss*
" mathjax
autocmd FileType markdown map <silent> <leader>M i\\[<Enter><Enter>\\]<Esc>ki
autocmd FileType markdown map <silent> <leader>m i\\(\\)<Esc>hhi

nmap ; :

" spellcheck
imap <c-s> 1z=`]a
nmap <c-s> 1z=

nnoremap <c-l> lea<C-X><C-S>

" change tabs
noremap <S-l> gt
noremap <S-h> gT

noremap <c-g> :Goyo<Enter>

" transparent vim
hi Normal guibg=NONE ctermbg=NONE


" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='dracula'

set foldlevelstart=20

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" let g:mkdp_markdown_css = '/home/near/Downloads/github-dark.css'
let g:mkdp_highlight_css = '/home/near/opt/ayu-highlight.css'
let g:mkdp_auto_start = 0
let g:mkdp_open_to_the_world = 1

autocmd! User GoyoEnter nested set eventignore=FocusGained
autocmd! User GoyoLeave nested set eventignore=

"JEKYLL
let g:jekyll_path = "/home/near/git/fatihkaan22.github.io"

" autocmd BufWritePost *.md !pandoc % -o out.pdf

vmap <Space>t :<c-u>call Turkish_Deasciify()<CR>

autocmd FileType markdown let g:indentLine_enabled=0

let g:polyglot_disabled = ['latex']

let g:vimtex_view_method = 'zathura'


let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_mode = 0


" let maplocalleader="\<space>"
let g:tex_flavor = "latex"

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" Fzf ------------------------------

map <C-f> :call Fzf_dev()<CR>

" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

noremap <silent> <leader>f :FormatCode<cr>

map <C-n> :NERDTreeToggle<CR>
let g:suda_smart_edit = 1

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }


" some other plugin already does the indenting "
let g:vim_markdown_new_list_item_indent = 0

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" vimwiki only vimwiki dir "
let g:vimwiki_global_ext = 0

" vimwiki md syntax "
au BufEnter *.md setl syntax=markdown

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

autocmd FileType * set concealcursor-=n
set concealcursor-=n
set concealcursor-=i
