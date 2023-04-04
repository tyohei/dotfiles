let s:dotfiles_vim = fnamemodify(expand('<sfile>'), ':h')
let s:vimrc_path = s:dotfiles_vim . '/vimrc'
execute ':source ' . s:vimrc_path


" ======== Dein ========
let s:cache_dir = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_dir . '/dein'
let s:dein = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein))
endif
let &runtimepath = s:dein . ',' . &runtimepath

let s:dein_toml = s:dotfiles_vim . '/dein.toml'
let s:deinlazy_toml = s:dotfiles_vim . '/deinlazy.toml'
if dein#load_state(s:dein)
  call dein#begin(s:dein)
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:deinlazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif


" ======== Terminal Mode ======== "
" https://github.com/neovim/neovim/issues/5073
" https://www.reddit.com/r/vim/comments/8n5bzs/using_neovim_is_there_a_way_to_display_a_terminal/
" https://gist.github.com/pocari/fd0622fb5ec6946a368e8ee0603979ae
let g:term_buf = -1
let g:term_win = -1

function! s:onTermClose(job_id, code, event) dict
  call feedkeys('\<CR>')
  let g:term_buf = -1
  let g:term_win = -1
endfunction

function! ToggleTerm()
  let l:term_height = 20
  if g:term_buf < 0
    " 1. Terminal is not launched
    botright new
    exec "resize " . l:term_height
    call termopen($SHELL, {'detach': 0, 'on_exit': function('s:onTermClose')})
    let g:term_buf = bufnr('')
    set nonumber
    set signcolumn=no
    startinsert!
    let g:term_win = win_getid()
  elseif g:term_buf == bufnr('')
    " 2. Terminal is launched and opened and focused
    hide
  else
    let l:term_win = bufwinid(g:term_buf)
    if l:term_win < 0
      " 3. Terminal is launched but closed
      botright split
      exec "resize " . l:term_height
      exec "buffer " . g:term_buf
      startinsert!
      let g:term_win = win_getid()
    else
      " 4. Terminal is launched and opened
      call win_gotoid(l:term_win)
    endif
  endif
endfunction

nnoremap <C-t> :call ToggleTerm()<CR>
