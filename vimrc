syntax on
filetype indent plugin on
set background=dark
if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
    colorscheme solarized
endif

" Line numbers
set nu

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ale
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" let g:ale_list_window_size = 5
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)

" lightline
set laststatus=2
set noshowmode
let g:lightline = {}
if has("gui_running")
    let g:lightline = {
          \ 'colorscheme': 'solarized',
          \ }
endif

" ale and lightline integration
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
    \     'linter_checking': 'left',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left',
    \     'gitbranch': 'right',
    \ }
let g:lightline.active = {
    \     'left': [[ 'mode', 'paste' ], [ 'gitbranch' ], [ 'readonly', 'filename' ], [ 'tagbar' ]],
    \     'right': [[ 'lineinfo' ], [ 'percent' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'fileformat', 'fileencoding', 'filetype' ]]
    \ }
let g:lightline.component_function = {
    \     'virtualenv': 'LightlineVirtualenv',
    \     'gitbranch': 'fugitive#head',
    \     'fileformat': 'LightlineFileformat',
    \     'filetype': 'LightlineFiletype',
    \     'fileencoding': 'LightlineFileencoding',
    \ }
function! LightlineVirtualenv()
  return get(split($VIRTUAL_ENV, "/"),-1,'')
endfunction
function! LightlineFileformat()
  return winwidth(0) > 100 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return winwidth(0) > 100 ? &filetype : ''
endfunction
function! LightlineFileencoding()
  return winwidth(0) > 100 ? &fileencoding : ''
endfunction

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
