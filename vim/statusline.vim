" vim: set et sw=2:

function! StatuslineModified()
  return &modifiable ? &modified ? ' [+]' : '' : ' [-]'
endfunction

function! StatuslineReadOnly()
  return &readonly ? '[!!]' : ''
endfunction

function! StatuslineFileFormatEncoding()
  let fmt = &ff != 'unix'
  let enc = &fenc != 'utf-8' && &fenc != '' && strlen(&fenc) != 0
  let status = ''

  if fmt || enc
    let status .= ' %#warningmsg#['
    let status .= fmt ? &ff : ''
    let status .= fmt && enc ? ',' : ''
    let status .= enc ? &fenc : ''
    let status .= ']%*'
  endif

  return status
endfunction

function! StatuslineTrailingSpace()
  if !exists('b:statusline_trailing_space_warning')
    let b:statusline_trailing_space_warning = &modifiable ? search('\s\+$', 'nw') != 0 ? ' %#warningmsg#[\s]%*' : '' : ''
  endif

  return b:statusline_trailing_space_warning
endfunction
autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning

function! StatuslineIndentTabSpace()
  if exists('b:statusline_indent_tab_space_warning')
    return b:statusline_indent_tab_space_warning
  endif

  if !&modifiable
    let b:statusline_indent_tab_space_warning = ''
    return b:statusline_indent_tab_space_warning
  endif

  let tabs      = search('\v^\t+\S', 'nw')            != 0
  let spaces    = search('\v^ +\S', 'nw')             != 0
  let scrambled = search('\v(^\t+ +)|(^ +\t+)', 'nw') != 0

  if scrambled
    let b:statusline_indent_tab_space_warning = ' %#warningmsg#[scrambled indent]%*'
  elseif tabs && spaces
    let b:statusline_indent_tab_space_warning = ' %#warningmsg#[mixed &et]%*'
  elseif (tabs && &et) || (spaces && !&et)
    let b:statusline_indent_tab_space_warning = ' %#warningmsg#[&et]%*'
  else
    let b:statusline_indent_tab_space_warning = ''
  endif

  return b:statusline_indent_tab_space_warning
endfunction
autocmd CursorHold,BufWritePost * unlet! b:statusline_indent_tab_space_warning

set statusline=%*
"set statusline+=[%!fugitive#head(7)]
set statusline+=\ %f\ [%l:%v]
set statusline+=%{StatuslineModified()}
set statusline+=%{StatuslineReadOnly()}
set statusline+=%{StatuslineFileFormatEncoding()}
set statusline+=%{StatuslineTrailingSpace()}
set statusline+=%{StatuslineIndentTabSpace()}
set statusline+=%=
set statusline+=%L\ /\ %P

