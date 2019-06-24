"" STATUSLINE
set laststatus=2
" hi StatusLine ctermbg=bg ctermfg=fg
" hi StatusLineNC ctermbg=bg ctermfg=fg
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237

" ------------------------ 8< ------------------------
hi User1 ctermfg=150
"Warning color
hi User2 ctermfg=167 
"Error Color
hi User3 ctermfg=172
" hi User3 ctermfg=106
hi User4 ctermfg=229
hi User5 ctermfg=191

" Statusline with highlight groups (requires Powerline font, using Solarized theme)
" let g:currentmode={
"       \ 'n'  : 'Normal ',
"       \ 'no' : 'N·Operator Pending ',
"       \ 'v'  : 'V ',
"       \ 'V'  : 'V·Line ',
"       \ 'x22' : 'V·Block ',
"       \ 's'  : 'Select ',
"       \ 'S'  : 'S·Line ',
"       \ 'x19' : 'S·Block ',
"       \ 'i'  : 'Insert ',
"       \ 'R'  : 'R ',
"       \ 'Rv' : 'V·Replace ',
"       \ 'c'  : 'Command ',
"       \ 'cv' : 'Vim Ex ',
"       \ 'ce' : 'Ex ',
"       \ 'r'  : 'Prompt ',
"       \ 'rm' : 'More ',
"       \ 'r?' : 'Confirm ',
"       \ '!'  : 'Shell ',
"       \ 't'  : 'Terminal '
"       \}

" function! ChangeStatuslineColor()
"   if (mode() =~# '\v(n|no)')
"     exe 'hi! User1 ctermfg=14 '
"   elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
"     exe 'hi! User1 ctermfg=200 '
"   elseif (mode() ==# 'i')
"     exe 'hi! User1 ctermfg=40 '
"   else
"     exe 'hi! User1 ctermfg=120 '
"   endif
"   return ''
" endfunction

function! S_ale_error()
  if exists('g:loaded_ale')
    let l:counts = ale#statusline#Count(bufnr(''))
      return l:counts[0] == 0 ? '' : '  ✗  '.l:counts[0]
  endif
  return ' '
endfunction

function! S_ale_warning()
  if exists('g:loaded_ale')
    let l:counts = ale#statusline#Count(bufnr(''))
    return l:counts[1] == 0 ? '' : '  ⚠  '.l:counts[1]
  endif
  return ' '
endfunction

function! S_ale_ok()
  if exists('g:loaded_ale')
    let l:counts = ale#statusline#Count(bufnr(''))
    if l:counts.total == 0
      return '  ✔ OK'
    endif
  endif
  return ' '
endfunction
" function! LinterStatus() abort
"   let l:counts = ale#statusline#Count(bufnr(''))

"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors

"   return l:counts.total == 0 ? 'OK' : printf(
"   \   '%dW %dE',
"   \   all_non_errors,
"   \   all_errors
"   \)
" endfunction

" function! GitInfo()
"   let git = fugitive#head()
"   if git != ''
"     return '  '.fugitive#head()
"   else
"     return ''
"   endif
" endfunction

" function! HunkInfo()
  

function! Current_git_branch()
    let l:branch = filter(split(fugitive#statusline(),'[(:)]'), 'v:val !~ "]"')
    if len(l:branch) == 3
       " return string(l:branch)
       let l:result = 'INDEX' . ':' . l:branch[1] . '~' . l:branch[2]
       return '    '.l:result
    endif
    if len(l:branch) == 2
         " return string(filter(l:branch, ['[]']))
         return '    '.remove(l:branch, 1)
         " return ' '.remove(l:branch, 1)
       " elseif len(l:branch) > 2
         " return ' '.remove(l:branch, 0)
    endif
    return '  '
endfunction
set statusline=
" set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
" set statusline+=%(%{&buflisted?:''}\ \ %)
" set statusline+=%4*\ %{toupper(g:currentmode[mode()])}  " Current mode
" set statusline+=%< " Truncate line here
" set statusline=[%4l]
" set statusline+=/
" set statusline+=%*%f\  " File path, as typed or relative to current directory
" set statusline+=%{expand('%:~:h')}
" set statusline+=%t
" set statusline+=%4*%.20F
" set statusline+=%{'...'}%.25{expand('%')}
set statusline+=%f
" set statusline+=%<%.20F
" set statusline+=%{expand('%:~:h')}/
" set statusline+=%t
set statusline+=%3*%{&modified?'+\ ':''}
set statusline+=%2*%{&readonly?'\ ':''}
" set statusline+=%{fugitive#statusline()}
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline+=%1*%{GitInfo()}
" set statusline+=%{join(GitGutterGetHunkSummary())} 
silent! set statusline+=%1*%{Current_git_branch()}
" set statusline+=%1*\  " Set highlight group to User1
set statusline+=%= " Separation point between left and right aligned items
" set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
" set statusline+=\ %* " Restore normal highlight
" set statusline+=%*\ %{&number?'':printf('%2d,',line('.'))} " Line number
" set statusline+=%-2v " Virtual column number
" set statusline=%f\ %{WebDevIconsGetFileTypeSymbol()}\ %h%w%m%r\ %=%(%l,%c%V\ %Y\ %=\ %P%)


set statusline+=%4*%{$CONDA_DEFAULT_ENV}\  
silent! set statusline+=%5*%{WebDevIconsGetFileTypeSymbol()}
set statusline+=%5*\ %2p%% " Percentage through file in lines as in |CTRL-G|

" set statusline+=%{LinterStatus()}
set statusline+=%2*%{S_ale_error()}
set statusline+=%3*%{S_ale_warning()}
set statusline+=%1*%{S_ale_ok()}
