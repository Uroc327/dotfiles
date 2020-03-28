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

" thanks to http://stackoverflow.com/a/6271254/1857229
function! <SID>GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" cursor stays on screen position
map <M-Up> <C-y><Up>
map <M-Down> <C-e><Down>
imap <M-Up> <Esc><C-y><Up>a
imap <M-Down> <Esc><C-e><Down>a

" cursor stays on file position
map <S-Up> <C-y>
map <S-Down> <C-e>
imap <S-Up> <Esc><C-y>a
imap <S-Down> <Esc><C-e>a

" deletion should leave yank register alone
noremap d "_d
nnoremap dd "_dd
noremap D "_D

" substition should leave yank register alone
noremap s "_s

" paste should leave yank register alone
vnoremap p pgvy

" double x should cut whole line
noremap xx Vx

" save and close
map <C-s> :wa<CR>
imap <C-s> <Esc>:wa<CR>a
cabbrev Q q
cabbrev Qa qa
cabbrev QA qa
cabbrev QQ q!
cabbrev Qq q!
cabbrev Qqa qa!
cabbrev QQa qa!

" tabbing
map <M-t> :tabnew<CR>
map <M-q> :tabclose<CR>
map <M-Tab> :tabNext<CR>
map <S-M-Tab> :tabPrevious<CR>

" strip trailing whitespace
map <silent> <F1> :call <SID>StripTrailingWhitespaces()<CR>
imap <silent> <F1> <Esc>:call <SID>StripTrailingWhitespaces()<CR>a

" F5 to build/exec
autocmd FileType tex   map  <buffer> <F5> :w<CR>:!make_latex.sh %<CR>

" S-F5 to REPL
autocmd Filetype vim   map  <buffer> <S-F5> :exec ':' . getline('.')<CR>
autocmd Filetype vim   map  <buffer> <F15> :exec ':' . getline('.')<CR>

" K to get help (default builtin with man or vimhelp)
autocmd FileType c,cpp map  <silent> <buffer> <Leader>K :exe "Man" 3 expand('<cword>')<CR>
autocmd FileType c,cpp vmap <silent> <buffer> <Leader>K :exe "Man" 3 <SID>GetVisualSelection()<CR>
autocmd FileType fstab map  <silent> <buffer> K :Man 5 fstab<CR>

" filetype man page: see also ebuild(1) ebuild(5)
" makefile: open browser??

for i in range(1, 9)
  execute 'autocmd FileType c,cpp,sh,bash,zsh,fstab map  <silent> <buffer> <Leader>' . i . 'K :exe "Man" ' . i . ' expand("<cword>")<CR>'
  execute 'autocmd FileType c,cpp,sh,bash,zsh,fstab vmap <silent> <buffer> <Leader>' . i . 'K :exe "Man" ' . i . ' <SID>GetVisualSelection()<CR>'
endfor

map <silent> <F7> :copen<CR>

map <silent> <F12> :call <SID>PrintSynStack()<CR>

" headings
nmap <Leader><Space>= "hY"hpkVr=j
nmap <Leader><Space>- "hY"hpkVr-j
nmap <Leader><Leader><Space>= kdd"hY"hpkVr=j
nmap <Leader><Leader><Space>- kdd"hY"hpkVr-j

" diffing
map <C-d> :diffthis<CR>
map <M-d> :diffoff<CR>:set nowrap<CR>

" reselect selection after indenting
vmap < <gv
vmap > >gv

" swap characters
map <Leader>xl xp
map <Leader>xh x<Left>P

" first and last pos in line
map <Leader><Leader>h 0
map <Leader>h ^
map <Leader>l $

" cd to directory of current file
map <C-f> :exe "cd ".expand('%:p:h')<CR>:pwd<CR>

" reload with encoding
map <Leader><Leader>utf8 :e! ++enc=utf-8<CR>
map <Leader><Leader>ucs :e! ++enc=ucs-bom<CR>
map <Leader><Leader>latin :e! ++enc=latin1<CR>

" folding
nmap <silent> <Space> @=(foldlevel('.')?'za':"<Space>")<CR>
vmap <Space> zf
map - zizc

" clear search pattern
map <silent> <Leader>/ :let @/ = ""<CR>

" highlight current search match
nmap <silent> <Leader><Leader>n :call <SID>BlinkMatch(0.4)<CR>

" don't jump when using *
nnoremap <silent> * :let windict=winsaveview()<CR>*:call winrestview(windict)<CR>:unlet windict<CR>

" terminal mode
tnoremap <Esc> <C-\><C-n>

