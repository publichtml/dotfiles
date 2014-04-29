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
NeoBundle 'basyura/unite-rails'
"NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'sickill/vim-monokai'
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nathanaelkane/vim-indent-guides'
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

" unite-rails
nnoremap [rails] <Nop>
nmap     <Space>r [rails]
nnoremap [rails]r :Unite rails/
nnoremap [rails]c :Unite rails/controller<Enter>
nnoremap [rails]v :Unite rails/view<Enter>
nnoremap [rails]m :Unite rails/model<Enter>
nnoremap [rails]h :Unite rails/helper<Enter>
nnoremap [rails]s :Unite rails/spec<Enter

" vim-fugitive
nnoremap [git] <Nop>
nmap     <Space>g [git]
nnoremap [git]s :Gstatus<Enter>
nnoremap [git]a :Gwrite<Enter>
nnoremap [git]c :Gcommit<Enter>
nnoremap [git]d :Gdiff<Enter>
nnoremap [git]v :Gitv<Enter>
nnoremap [git]b :Gblame<Enter>
