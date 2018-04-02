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
    \     'linter_ok': 'left'
    \ }
let g:lightline.active = {
    \     'left': [[ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'tagbar' ]],
    \     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'lineinfo', 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ]]
    \ }
" ale
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 5
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
