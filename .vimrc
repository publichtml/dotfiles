set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set number
syntax on

" NeoBundle
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on

" uniteをインサートモードでスタート
let g:unite_enable_start_insert = 1

" 初期設定関数を起動する
autocmd filetype unite call s:unite_my_settings()

" Unite overwrite settings.
function! s:unite_my_settings()"{{{
  " エスケープで去る
  nmap <buffer> <ESC> <Plug>(unite_exit)
  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
  " インサート脱出
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> kk <Plug>(unite_insert_leave)
endfunction"}}}

" unite key
nnoremap [unite] <Nop>
nmap     <Space>u [unite]
nnoremap [unite]f :Unite file<Enter>
nnoremap [unite]n :Unite file/new<Enter>
nnoremap [unite]b :Unite buffer<Enter>
nnoremap [unite]r :Unite file_mru<Enter>
nnoremap [unite]s :Unite vcs_grep<Enter>
