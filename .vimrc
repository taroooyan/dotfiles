" NeoBundl
if isdirectory(expand("~/.vim/bundle/neobundle.vim"))
  " Note: Skip initialization for vim-tiny or vim-small.
  if !1	| finish | endif
  if has('vim_starting')
    if &compatible
      " Be iMproved
      set nocompatible
    endif
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " update vimproc 
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
        \ },
        \ }

  " color scheme molokai
  NeoBundle 'tomasr/molokai'

  " Rails 
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'vim-ruby/vim-ruby'

  " Arduino
  NeoBundle "sudar/vim-arduino-syntax"

  " Markdown
  NeoBundle "plasticboy/vim-markdown"

  " HTML/CSS
  NeoBundle "othree/html5.vim"
  NeoBundle 'mattn/emmet-vim'

  " Go
  NeoBundle 'fatih/vim-go'

  " コメントON/OFFを手軽に実行
  NeoBundle 'tomtom/tcomment_vim'

  " スニペット機能を追加
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'

  call neobundle#end()

  " Required:
  filetype plugin indent on
  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
endif

" color scheme is molokai
colorscheme molokai
set t_Co=256

" complete is strong
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : { 'insert' : 1,}
        \ }
endif

" auto comment out disable
autocmd FileType * setlocal formatoptions-=ro
set clipboard+=unnamed
set clipboard+=autoselect

" for ubuntu 15.04
set clipboard=unnamedplus

" バックスペースキーで行頭を削除する
set backspace=indent,eol,start

" delete key of mac is enable
noremap  
noremap!  

" {}() outo into
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap "" ""<Left>

" special-character is visualization
set list
set listchars=tab:»-,eol:$,trail:-,extends:»,precedes:«,nbsp:%

" write under line
set cursorline

" show something in statusline
set laststatus=2
set statusline=%F%m%r%h%w%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [LEN=%L]\ [%p%%]

" show line number
set number

" syntax
syntax on

" encoding
set encoding=utf-8

" long text is next line
set wrap

" show input command
set showcmd

" use C-a
cnoremap <C-a> <Home>

" background is same system setting
highlight Normal ctermbg=none

" 行頭と行末の移動をC-l,C-hでする
noremap <S-l> $
noremap <S-h> ^

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-k>j
nnoremap <C-l> :<C-l>j
nnoremap <C-h> :<C-h>j

" 対応する括弧などをハイライト表示する
set showmatch

" 対応括弧のハイライト表示を3秒にする
set matchtime=3

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" change comment out color
hi Comment ctermfg=blue

" syntax of arduino
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" neocomplete {{{
let g:neocomplete#enable_at_startup=1
let g:neocomplete#auto_completion_start_length=3
let g:neocomplete#enable_ignore_case=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#enable_camel_case=1
let g:neocomplete#use_vimproc=1
let g:neocomplete#sources#buffer#cache_limit_size=1000000
let g:neocomplete#sources#tags#cache_limit_size=30000000
let g:neocomplete#enable_fuzzy_completion=1
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
" }}}

set softtabstop=2
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"TABをSPACEに変換する
menu User.Global.Space :set expandtab<CR>:retab<CR>


""" 言語設定
"" Python環境
" coding規約(pep8)
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" template
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4 shiftwidth=4

"" Ruby環境
" template
autocmd BufNewFile *.rb 0r $HOME/.vim/template/ruby.txt
autocmd BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2 shiftwidth=2

"" C++
" template
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/c++.txt
autocmd BufRead,BufNewFile *.cpp set tabstop=4 shiftwidth=4 shiftwidth=4
" clang_complete
let g:clang_periodic_quickfix = 1
let g:clang_complete_copen = 1
let g:clang_use_library = 1

