"set shell=xterm-kitty
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

"Plug 'VundleVim/Vundle.vim'
Plug 'ayu-theme/ayu-vim'
" Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/Yggdroot/indentLine.git'
" Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
"Plug 'psf/black'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-eunuch'
Plug 'UnikMask/iroh-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'dylanaraps/wal.vim'
Plug 'theniceboy/vim-calc'
"Plug 'numirias/semshi'
Plug 'dominikduda/vim_current_word'
Plug 'nvie/vim-flake8'

Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'sjl/gundo.vim'

Plug 'Winseven4lyf/vim-bbcode'
Plug 'KabbAmine/vCoolor.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}


" neovim 5.0 plugins
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'


Plug 'mfussenegger/nvim-jdtls'


Plug 'terryma/vim-multiple-cursors'

Plug 'mbbill/undotree'

" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()           " required
filetype plugin indent on    " required



" General
set number relativenumber	" Show line numbers
set wrap
set linebreak	" Break lines at word (requires Wrap lines)
autocmd FocusGained * checktime

set showbreak=+++ 	" Wrap-broken line prefix
"set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set mouse=a
set t_vb=
set encoding=UTF-8
"set nohlsearch
"set nohls

" Advanced
set ruler	" Show row and column ruler information 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set clipboard=unnamedplus
set go+=a



set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set backupdir=~/.vim/backup/ " backups

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
set shortmess=a
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set shortmess-=S " Amount of search results to show
"set autochdir

let g:ctrlp_map = '<c-p>'

" Insert mode CTRL-W for WORDs
inoremap <C-Q> <C-\><C-O>dB

" Resize splits when the window is resized
au VimResized * :wincmd =


" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

au BufWinEnter,BufEnter,FocusGained,FocusLost NvimTree setlocal nonumber norelativenumber 
" }}}

nnoremap <LEADER>s :wq<CR>
nnoremap <LEADER>q :q<CR>

" normal copy/paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
vmap <C-v> "_dP
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui
"nmap <C-f> /
"vmap <C-f> /
"imap <C-f> <Esc>/
nnoremap <C-f> :Lines<CR>
vmap > >gv
vmap < <gv 
nmap <C-S> :w<CR>
map <C-a> ggVGG
nmap <S-f> =i{
vmap <S-f> =
nnoremap <Leader>t :!tidy -q -i --show-errors 0<CR>

command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %

nnoremap <F5> :UndotreeToggle<cr>

let mapleader=','
nnoremap <LEADER>a :call Calc()<CR>
nnoremap <Leader>nn : NERDTreeToggle<cr>
nnoremap <Leader>w :bnext<CR>

" Auto correct
"setlocal spell
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u



"   inoremap <silent><expr> <TAB>
"         \ pumvisible() ? "\<C-n>" :
"         \ <SID>check_back_space() ? "\<TAB>" :
"         \ coc#refresh()
"   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"  " GoTo code navigation.
"  nmap <silent> gd <Plug>(coc-definition)
"  nmap <silent> gy <Plug>(coc-type-definition)
"  nmap <silent> gi <Plug>(coc-implementation)
"  nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

"   autocmd CursorHold * silent call CocActionAsync('highlight')
"   
"   " Add `:Format` command to format current buffer.
"   command! -nargs=0 Format :call CocAction('format')
"   
"   " Add `:Fold` command to fold current buffer.
"   command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"   
"   " Add `:OR` command for organize imports of the current buffer.
"   command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" Buffer Switching
nnoremap \] :blast<CR>
nnoremap \[ :bnext<CR>



" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger = "<nop>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit = "vertical"
let g:black_skip_string_normalization = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E,W,F403'

"   inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

syntax on
" set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme iroh
colorscheme wal

hi Normal guibg=NONE ctermbg=NONE

" IndentLine {{
" Use '│' normally
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_setColors = 0
" }}

set number


" let NERDTreeShowHidden = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
" let g:NERDTreeDirArrowExpandable = ' '
" let g:NERDTreeDirArrowCollapsible = ' '
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Auto reload on vimrc changes



autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Autoset syntax on .conf files
autocmd BufNewFile,BufRead *.conf setfiletype dosini


" FZF
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'

let $FZF_DEFAULT_OPTS = '--color=bg:#20242C --border --layout=reverse --bind change:top'

"let $FZF_DEFAULT_COMMAND = 'fd --type file'
"let $FZF_DEFAULT_OPTS = '--ansi'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:ctrlp_show_hidden = 1
let g:fzf_preview_window = ['down:40%']

function! FloatingFZF()
 let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height,
               \ 'style': 'minimal'
               \}

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine') 
endfunction




command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931


" highlight NormalFloat ctermbg=0 guibg=#66002931


" nnoremap <silent> <C-p> :<C-u>CocCommand fzf-preview.DirectoryFiles .<CR>
" nnoremap <silent> <C-i> :<C-u>CocCommand fzf-preview.ProjectGrep<CR>

" map <silent> <C-p> :Files<CR>

let g:fzf_preview_use_dev_icons = 1
"let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG


" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=


" HTML tag closing
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Ranger
nnoremap <leader>r :silent !ranger %:h<cr>:redraw!<cr>
nnoremap <leader>R :silent !ranger<cr>:redraw!<cr>

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_


" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let &fcs='eob: '
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


let g:vim_current_word#highlight_current_word = 0

nmap ,c :%s///gn

" Markdown Preview
nmap <leader>m <Plug>MarkdownPreviewToggle

let g:mkdp_browser = 'firefox-nightly'
let g:mkdp_auto_start = 0

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 1
    \ }

let g:mkdp_markdown_css = expand('~/.config/nvim/markdowncss.css')

"  " ZATHURA Markdown
"  " Call compile
"  " Open the PDF from /tmp/
"  function! Preview()
"          :call Compile()<CR><CR>
"          execute "! zathura /tmp/op.pdf"
"  endfunction
"  
"  " [1] Get the extension of the file
"  " [2] Apply appropriate compilation command
"  " [3] Save PDF as /tmp/op.pdf
"  function! Compile()
"          let extension = expand('%:e')
"          if extension == "ms"
"                  execute "! groff -ms % -T pdf > /tmp/op.pdf"
"          elseif extension == "tex"
"                  execute "! pandoc -f latex -t latex % -o /tmp/op.pdf"
"          elseif extension == "md"
"                  execute "! pandoc % --pdf-engine=xelatex -s -o /tmp/op.pdf"
"          endif
"  endfunction
"  
"  " map \ + p to preview
"  noremap <leader>p :call Preview()<CR><CR><CR>
"  
"  " map \ + q to compile
"  noremap <leader>q :call Compile()<CR><CR>


" neovim 5.0 stuff
" set completeopt=menuone,noselect
" Load in PyRight LSP
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" Auto complete
source ~/.config/nvim/conf/compe.vim

" Tree-sitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_instalmed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF


inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


" Telescope
source ~/.config/nvim/conf/telescope.vim

" nvim-tree
source ~/.config/nvim/conf/nvim-tree.vim
