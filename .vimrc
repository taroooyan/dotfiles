if isdirectory(expand("~/.vim/bundle/neobundle.vim"))
	" Note: Skip initialization for vim-tiny or vim-small.
	if !1 	| finish | endif

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

	" My Bundles here:
	" Refer to |:NeoBundle-examples|.
	" Note: You don't set neobundle setting in .gvimrc!
	" molokai
	NeoBundle 'tomasr/molokai'
	" rails 
	NeoBundle 'tpope/vim-rails'
	" syntastic
	NeoBundle 'scrooloose/syntastic'
	" syntax of Arduino 
	NeoBundle "sudar/vim-arduino-syntax"
	let g:syntastic_enable_signs=1
	let g:syntastic_auto_loc_list=2
	NeoBundle "plasticboy/vim-markdown"
	NeoBundle "kannokanno/previm"
	NeoBundle "tyru/open-browser.vim"
	NeoBundle "Shougo/unite.vim"
	NeoBundle "Shougo/vimfiler"

	call neobundle#end()

	" Required:
	filetype plugin indent on

	" If there are uninstalled bundles found on startup,
	" this will conveniently prompt you to install them.
	NeoBundleCheck
endif
"color scheme
colorscheme molokai
"complete is strong
if has('lua')
	NeoBundleLazy 'Shougo/neocomplete.vim', {
				\ 'depends' : 'Shougo/vimproc',
				\ 'autoload' : { 'insert' : 1,}
				\ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
			\ 'depends': ['Shougo/vimproc', 'Shougo/unite.vim'],
			\ 'autoload' : {
			\ 'commands' : ['Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'],
			\ 'unite_sources' : ['tags']
			\ }}


"{}close
set foldmethod=marker foldmarker={,}
" auto comment out disable
autocmd FileType * setlocal formatoptions-=ro
set clipboard+=unnamed
set backspace=indent,eol,start
"long text is shown one line
"set nowrap
"delete key of mac is enable
noremap  
noremap!  
"{}() outo into
inoremap () ()<Left>
inoremap {} {}<Left>
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.markdown 0r $HOME/.vim/template/markdown.txt
"input date
nmap <C-d> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>
"special-character is visualization
set list
set listchars=tab:\¦\ ,eol:$,trail:-,extends:»,precedes:«,nbsp:%
"strong search
set incsearch
"write under line
set cursorline
"show something in statusline
set laststatus=2
set statusline=%F%m%r%h%w%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [LEN=%L]\ [%p%%]
"show line number
set number
"syntax
syntax on
"ajustment
set tabstop=4
set shiftwidth=4
"japanese language
set encoding=utf-8
"long text is next line
set wrap
"show input command
set showcmd
"spqce to tab
set noexpandtab
retab!
"use C-a
cnoremap <C-a> <Home>
"
noremap <S-l>   $
noremap <S-h>   ^

