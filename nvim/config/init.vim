" init.vim contains all of the initialization plugins for vim
" note that this has to be sourced second since dein needs to
" run its scripts first. This contains misc startup settings
" for vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Enable syntax highlighting
syntax on

" Fixes backspace
set backspace=indent,eol,start

" Enable line numbers
" set nu

" Enable line/column info at bottom
set ruler
set cursorline " highlights current line
set noswapfile
set noshowmode
set foldlevelstart=99
set scrolloff=10

" Autoindentation
set ai
filetype indent plugin on

" Copies using system clipboard
set clipboard+=unnamedplus

" Tab = 4 spaces
set tabstop=4
set shiftwidth=4
set sta
set et
set sts=4

" enable mouse support
set mouse=a mousemodel=popup

" markdown file recognition
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" relative line numbers
" Sets relative line numbers in normal mode, absolute line numbers in insert
" mode
" set number
" set relativenumber

" use ripgreg instead of grep
set grepprg=rg\ --vimgrep

" python packages in venv
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Set colors in terminal
" Solarized, dark, with true color support
" set termguicolors
autocmd ColorScheme * highlight Normal ctermbg=None
set background=dark
silent! colorscheme gruvbox

" close vim if only window left is nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI=1

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

set hidden

""" Autoread helper
au FocusGained,BufEnter * :checktime
set autoread

"CONDA
" let g:conda_startup_msg_suppress = 1

" PYDOCSTRING"
nmap <silent> <C-a> <Plug>(pydocstring)

set signcolumn=yes

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt-=preview

" TAGBAR
let g:tagbar_compact = 1

highlight! EndOfBuffer ctermbg=none ctermfg=235
highlight GitGutterAdd ctermbg=none ctermfg=245
highlight GitGutterChange ctermbg=none ctermfg=245
highlight GitGutterDelete ctermbg=none ctermfg=245
highlight GitGutterChangeDelete ctermbg=none ctermfg=245
highlight ALEErrorSign ctermbg=none ctermfg=red
highlight ALEWarningSign ctermbg=none ctermfg=darkyellow
highlight clear SignColumn

" ALE
let g:ale_sign_column_always = 1
" Disable completion where available from ALE
" (not worth creating a separate file just for a one-liner)
let g:ale_completion_enabled = 0
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠'
" let g:ale_python_pylint_executable = '/home/cyrano5614/miniconda3/bin/pylint'
" let g:ale_python_flake8_executable = '/home/cyrano5614/miniconda3/bin/flake8'
" let g:ale_sign_offset = 500000
let g:ale_set_locklist = 0
let g:ale_set_quickfix = 1
 " nmap <F8> <Plug>(ale_fix)

" STATUSLINE
" let g:loaded_lightline_powerful = 1
" let g:lightline_delphinus_use_nerd_fonts_gliphs = 1
" let g:lightline_delphinus_colorscheme = 'nord_improved'
" let g:lightline_delphinus_use_powerline_glyphs = 1
" let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox'
" hi StatusLine ctermbg=bg ctermfg=fg
" hi StatusLineNC ctermbg=bg ctermfg=fg
" set statusline=%=&P\ %f\ %m
" set fillchars=vert:\ ,stl:\ ,stlnc:\ 
" set laststatus=2




" nr2char(...) is for describing icons from devicons
let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']

" YCM
" let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_global_ycm_extra_conf = $HOME . '/.local/share/nvim/site/plugged/YouCompleteMe/.ycm_extra_conf.py'

" NOTMUCH
" let g:notmuch_reader = 'mutt -f %s'
let g:notmuch_reader = 'w3m -f %s'
let g:notmuch_sendmail = 'msmtp'

" GRIP for github markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='google-chrome-stable'

" TERRAFORM
let g:terraform_fmt_on_save=1
let g:terraform_commentstring='//%s'
let g:terraform_align=1

" FZF settings
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
