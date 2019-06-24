"" Map leader to ,
let mapleader=','

" Useful fix commands
command FixDos %s///g
command FixWhite %s/\s\+$//e

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" " split pane navigation
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

"" Buffer nav
noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Tav nav
" noremap <leader>z :bp<CR>
noremap <leader>q :tabprevious<CR>
" noremap <leader>x :bn<CR>
noremap <leader>w :tabnext<CR>

" nmap <leader>e :edit
" nmap <leader>t :tabedit

" Close buffer but not vim
noremap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

if has('nvim')
"" To map <Esc> to exit terminal-mode:
" tnoremap <Esc> <C-\><C-n>

"" To simulate |i_CTRL-R| in terminal-mode:
"" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"" To use `CTR+{h,j,k,l}` to navigate windows from any mode:
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
endif
" tnoremap <Esc> <C-\><C-n>

inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Delete trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nmap <silent> <F4> :TagbarToggle<CR>


" nerdtree
" autocmd vimenter * NERDTree " start nerdtree automatically when vim starts up
:map <silent> <F2> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree



" fzy
" nnoremap <C-p> :FuzzyOpen<CR>
" nnoremap <C-s> :FuzzyGrep<CR>
"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" VIMUX
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
 " Zoom the tmux runner page
map <Leader>vz :VimuxZoomRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <Leader>vs :VimuxInterruptRunner<CR>

map <Leader>vr :call VimuxRunCommand("python " . bufname("%"))<CR>

"FZF
nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :Files ~<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>m :History<CR>
nnoremap <silent> <leader>gf :GFiles<CR>

" let g:current_conda = system('echo $CONDA_PREFIX')
" let g:current_conda = $CONDA_PREFIX
" let g:deoplete#sources#jedi#python_path = g:current_conda . '/bin/python'
" let g:current_pyls = g:current_conda . '/bin/pyls'
" if shell_error == 0
"   let venv_path = substitute(pipenv_venv_path, '\n', '', '')
"   let g:ycm_python_binary_path = venv_path . '/bin/python'
" else
"   let g:ycm_python_binary_path = 'python'
" endif

" if g:current_conda == ""
"     " let g:deoplete#sources#jedi#python_path = $HOME . "/miniconda3/envs/markable/bin/python"
"     let g:current_pyls = $HOME . "/miniconda3/envs/gen3/bin/pyls"
"     let g:ycm_python_binary_path = $HOME . "/miniconda3/envs/work/bin/python"
" else
"     " let g:deoplete#sources#jedi#python_path = g:current_conda . '/bin/python'
"     let g:ycm_python_binary_path = g:current_conda . "/bin/python"
"     let g:current_pyls = g:current_conda . '/bin/pyls'
" endif


" Fugitive keys
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gb :Gblame<cr>

" CTRLSF
nmap <leader>s <Plug>CtrlSFPrompt
nmap <leader>S <Plug>CtrlSFCwordPath
map <silent> <F3> :CtrlSFToggle<CR>
" nmap     <C-F>f <Plug>CtrlSFPrompt
" vmap     <C-F>f <Plug>CtrlSFVwordPath
" vmap     <C-F>F <Plug>CtrlSFVwordExec
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
" nnoremap <C-F>o :CtrlSFOpen<CR>
" nnoremap <C-F>t :CtrlSFToggle<CR>
" inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

nnoremap <leader>g :YcmCompleter GoTo<CR> 
nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>n :YcmCompleter GoToReferences<CR>
" nnoremap <leader>r :YcmCompleter <CR>
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<C-y>"
let g:UltiSnipsJumpBackwardTrigger="<C-t>"
" let g:ycm_key_select_completion = "<Enter>"
