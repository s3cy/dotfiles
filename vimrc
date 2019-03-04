"dein scripts-----
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('neoclide/coc.nvim')

  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-repeat')
  call dein#add('jiangmiao/auto-pairs',
              \{'on_i': 1})
  call dein#add('justinmk/vim-sneak')
  call dein#add('wellle/targets.vim')
  call dein#add('jremmen/vim-ripgrep',
              \{'on_cmd': 'Rg'})
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('christoomey/vim-tmux-navigator')

  call dein#add('flazz/vim-colorschemes')
  call dein#add('itchyny/lightline.vim')

  call dein#add('vimwiki/vimwiki',
              \{'on_ft': 'markdown'})
  call dein#add('iamcco/markdown-preview.vim',
              \{'on_ft': 'markdown'},
              \{'on_cmd': 'MarkdownPreview'})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" auto remove plugins
call map(dein#check_clean(), "delete(v:val, 'rf')")
"end dein scripts-----

if exists('$TMUX')
    set term=screen-256color
endif

let mapleader = "\<space>"

nmap <leader>n :noh<enter>
nmap <leader>p "+p
nmap <leader>y "+y
" save file
nnoremap <C-s> :w<cr>
" emacs like shortcuts
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
" easy navigations
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" No arrow keys
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
noremap <UP> <NOP>
noremap <DOWN> <NOP>

" coc.nvim
set hidden
set cmdheight=2
set signcolumn=yes
set shortmess+=c

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction


nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)
nmap <leader>= :call CocAction('format')<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>o :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>j :<C-u>CocNext<cr>
nnoremap <silent> <leader>k :<C-u>CocPrev<cr>
nnoremap <silent> <leader><space> :<C-u>CocListResume<cr>

" rg
noremap <C-f> :Rg<space>
" Show line number
set number
" Show partial command
set showcmd
" Set tab width to 4, fill tab with spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
retab " change all tabs to spaces
" Set to Molokai theme
colorscheme molokai_dark
let g:rehash256 = 1
set background=dark
" Real time search. Highlight all search results. :noh to cancel
set incsearch
set hlsearch
" Split a new window to below/right
set splitbelow
set splitright
" Set MatchParen blink cursor color to white
hi MatchParen ctermfg=white
" Open a file in the last closed position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set ignorecase
set smartcase
set mouse=a "enable mouse support

" gg=G in python now uses yapf as backend
autocmd Filetype python setlocal equalprg=yapf

" html and javascript has tab size = 2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2

" highlight cursor line only in active window
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" ripgrep
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_list = [{'path': '~/Sync/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'auto_toc': 1, 'list_margin': 0}]

" lightline
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'default',
            \ 'active': {
            \   'left': [ ['mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B',
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \ },
            \ }
