" vim: set et sw=2:

function! <SID>StripTrailingWhitespaces()
  let _s = @/
  let l = line('.')
  let c = virtcol('.')
  %s/\s\+$//e
  let @/ = _s
  call cursor(l, c)
endfunction

function! <SID>PrintSynStack()
  if exists("*synstack")
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endif
endfunction

function! <SID>BlinkMatch(blinktime)
  let [ bufnum, lnum, col, off ] = getpos('.')
  let target_pat = '\c\%#'.@/
  let matchblink = matchadd('SearchBlink', target_pat, 101)
  redraw
  exec 'sleep '.float2nr(a:blinktime * 1000).'m'
  call matchdelete(matchblink)
  redraw
endfunction

" cursor stays on screen position
map <M-Up> <C-Y><Up>
map <M-Down> <C-E><Down>
imap <M-Up> <Esc><C-Y><Up>a
imap <M-Down> <Esc><C-E><Down>a

" cursor stays on file position
map <S-Up> <C-Y>
map <S-Down> <C-E>
imap <S-Up> <Esc><C-Y>a
imap <S-Down> <Esc><C-E>a

" fast movement
map <S-Right> 6<Right>
map <S-Left> 6<Left>
imap <S-Right> <Esc>6<Right>a
imap <S-Left> <Esc>6<Left>a

" double x should cut whole line
map xx dd

" save and close
map <C-S> :wa<CR>
imap <C-S> <Esc>:wa<CR>a
cabbrev Q q
cabbrev Qa qa
cabbrev QA qa
cabbrev QQ q!
cabbrev Qq q!
cabbrev Qqa qa!
cabbrev QQa qa!

map <silent> <F1> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufRead,BufNewFile *.c,*.cpp,*.h  map <silent> <F6> :exe "Man" 3 expand('<cword>')<CR>
autocmd BufRead,BufNewFile *.vim          map <silent> <F6> :exe "h" expand('<cword>')<CR>
map <silent> <F7> :copen<CR>
map <silent> <F12> :call <SID>PrintSynStack()<CR>

" diffing
map <C-D> :diffthis<CR>
map <M-d> :diffoff<CR>:set nowrap<CR>

" reselect selection after indenting
vmap < <gv
vmap > >gv

" first and last pos in line
map <Leader><Leader>h 0
map <Leader>h ^
map <Leader>l $

" cd to directory of current file
map <C-F> :exe "cd ".expand('%:p:h')<CR>:pwd<CR>

" folding
nmap <silent> <Space> @=(foldlevel('.')?'za':"<Space>")<CR>
vmap <Space> zf
map - zizc

" clear search pattern
map <silent> <Leader>/ :let @/ = ""<CR>

" highlight current search match
nmap <silent> <Leader><Leader>n :call <SID>BlinkMatch(0.4)<CR>

