set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set number
set incsearch
set hlsearch
set ignorecase
set smartcase
syntax on

" for windows
set backspace=indent,eol,start

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

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
" NeoBundle 'tomasr/molokai'
"NeoBundle 'sickill/vim-monokai'
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tyru/caw.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-endwise'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
nnoremap [rails]s :Unite rails/spec<Enter>
nnoremap [rails]l :Unite rails/lib<Enter>
nnoremap [rails]d :Unite rails/db<Enter>
nnoremap [rails]cf :Unite rails/config<Enter>
nnoremap [rails]log :Unite rails/log<Enter>

" vim-fugitive
nnoremap [git] <Nop>
nmap     <Space>g [git]
nnoremap [git]s :Gstatus<Enter>
nnoremap [git]a :Gwrite<Enter>
nnoremap [git]c :Gcommit<Enter>
nnoremap [git]d :Gdiff<Enter>
nnoremap [git]v :Gitv<Enter>
nnoremap [git]b :Gblame<Enter>

" vim-indent-guides
" colorscheme default
colorscheme koehler
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_guide_size=1

" caw.vim
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" ファイル保存時に行末の空白を削除する
function! s:remove_dust()
  let cursor = getpos(".")
  " 保存時に行末の空白を除去する
  %s/\s\+$//ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" vim-rspecでspecを実行した時にvim-dispatchに渡してtmux上の別ペインで実行する
let g:rspec_command = "Dispatch bundle exec rake spec SPEC={spec}"

source ~/dotfiles/.vimrc.local
