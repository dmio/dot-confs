set t_Co=256

set sw=4 ts=4 sts=4 et
set background=dark
set autoindent
filetype indent on
syntax on
hi Search term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
set tags+=tags;

" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
function! Inc(...)
	let result = g:i
	let g:i += a:0 > 0 ? a:1 : 1
	return result
endfunction

nnoremap <esc><esc><esc> :noh<return>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"Plug '~/.fzf'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/jeetsukumaran/vim-buffergator.git'
Plug 'brookhong/cscope.vim'
Plug 'tpope/vim-obsession'
Plug 'Asheq/close-buffers.vim'
Plug 'inkarkat/vim-mark' | Plug 'inkarkat/vim-ingo-library' " ingo is dependency of inkarkat/vim-mark
call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

" vim-mark
nnoremap <unique> <Leader>c <Plug>MarkAllClear<return>

" vim-buffergator
nmap <silent> ;b :BuffergatorToggle<return>
let g:buffergator_suppress_keymaps = 1

ru my_netrw.vim

nnoremap ;o :exec "tabedit "@*<cr>
nnoremap ;t :tabnew<return>
nnoremap ;s :tab split<return>

" fzf.vim
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>

" cscope.vim
nnoremap <leader>sa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>ss :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>sg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>sd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>sc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>st :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>se :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>sf :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>si :call CscopeFind('i', expand('<cword>'))<CR>

" let GtagsCscope_Auto_Map = 1
" let GtagsCscope_Auto_Load = 1
" set cscopetag

" Gtags
let Gtags_No_Auto_Jump = 1
let Gtags_Close_When_Single = 1
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
nnoremap <leader>gd :Gtags -d<CR><CR>
nnoremap <leader>gr :Gtags -r<CR><CR>
nnoremap <leader>gs :Gtags -s<CR><CR>
nnoremap <leader>gc :GtagsCursor<CR>
nnoremap <leader>gu :GtagsUpdate<CR>

if has("autocmd")
  augroup templates
    "autocmd BufNewFile test??.c 0r ~/.vim/templates/skel_test.c|/return/|normal! O |start
    autocmd BufNewFile test??.c 0r ~/.vim/templates/skel_test.c|/return/
  augroup END
endif
