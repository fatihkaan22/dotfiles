set nocompatible              

filetype off                  " required
call plug#begin('~/.vim/plugged')
if has('nvim')
		" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
		Plug 'folke/todo-comments.nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-lua/popup.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'folke/lsp-colors.nvim'
		" Plug 'lukas-reineke/indent-blankline.nvim'
		" Plug 'kdav5758/TrueZen.nvim'
else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
endif
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'NLKNguyen/papercolor-theme'
		Plug 'pseewald/anyfold'
		Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
		Plug 'lervag/vimtex'
		Plug 'lambdalisue/suda.vim' 
		Plug 'tpope/vim-commentary'
 		Plug 'itchyny/lightline.vim'
		Plug 'tpope/vim-fugitive'
		" Plug 'deoplete-plugins/deoplete-jedi'
		Plug 'wakatime/vim-wakatime'
		Plug 'michaeljsmith/vim-indent-object'
		Plug 'Yggdroot/indentLine'
		Plug 'Shougo/context_filetype.vim'
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

syntax enable

compiler gcc

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
" hi Normal guibg=NONE ctermbg=NONE


" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='dracula'

set foldlevelstart=20

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
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
let g:indentLine_char = '▏'

" let g:polyglot_disabled = ['latex']

let g:vimtex_view_method = 'zathura'


let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_mode = 0


" let maplocalleader="\<space>"
let g:tex_flavor = "latex"

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

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

" let g:rainbow_active = 1

:command Gadd Git add %
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>ga :G add %<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>

set bg=light
" set bg=dark
color one
" color dracula


autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=0


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" coc
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
