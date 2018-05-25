syntax enable
set background=dark
colorscheme hybrid
set tabstop=2
set shiftwidth=2
set autoindent
set noswapfile
set smartindent
set expandtab
set backspace=start,eol,indent
set incsearch
set wildmenu wildmode=list:full
set ignorecase
set number
"set title set write
set modifiable
set clipboard=unnamed,autoselect
set shell=/bin/bash

if has("mouse")
  set mouse=a
endif

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.java setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.swift setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

"autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit

au QuickfixCmdPost make,grep,grepadd,vimgrep copen
"autocmd VimEnter * Unite file -winwidth=30 -no-quit

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_ignore_case = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#keyword_patterns = {}
"let g:neocomplete#keyword_patterns._ = '\h\w*'

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" 
let g:netrw_nogx =1
"nmap gx <Plug>(openbrowser-smart-search)
"vmap gx <Plug>(openbrowser-smart-search)
"noremap <C-o> :!open -a "Google Chrome" %<CR>
noremap tn :tabnew<CR>
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use .
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }
let g:unite_enable_split_vertically=1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1

let g:neocomplete_php_locale = 'ja'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"emmet <C-t>後に<,>
let g:user_emmet_leader_key='<C-t>'

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"unite
nnoremap <silent> ,uf :<C-u>Unite file -winwidth=30 -no-split -no-quit<CR>
nnoremap <silent> ,ub :<C-u>Unite bookmark -winwidth=30 -no-split -no-quit<CR>
nnoremap <silent> ,g  :<C-u>Unite grep:. -winwidth=50 -no-quit -buffer-name=search-buffer<CR>

"vimfiler
let g:vimfiler_enable_auto_cd = 1
nnoremap <silent> ,vf :<C-u>VimFiler -split -winheight=15 -no-quit -horizontal -direction=botright -auto-cd<CR>

"ctrlp
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:15,max:15,results:15'
nnoremap ,cp :<C-u>:CtrlPCurWD<CR>

"plugin
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'mattn/emmet-vim'
"NeoBundle 'open-browser.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'othree/html5.vim'
"NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'violetyk/neocomplete-php.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle "cohama/vim-smartinput-endwise"
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'andrew-d/vim-grep-syntax'
NeoBundle 'udalov/kotlin-vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'slim-template/vim-slim'


"ag_grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --column'
  let g:unite_source_grep_recursive_opt = ''
endif

call neobundle#end()
"      
" Required:
filetype plugin indent on
NeoBundleCheck
"            
