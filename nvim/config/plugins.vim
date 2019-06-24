set nocompatible

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
call plug#begin(expand('~/.local/share/nvim/site/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'pedrohdz/vim-yaml-folds'
" Plug 'Shougo/echodoc.vim'
Plug 'hashivim/vim-terraform'
Plug 'heavenshell/vim-pydocstring'
Plug 'sheerun/vim-polyglot'
Plug 'diepm/vim-rest-console'
" Plug 'Shougo/vimshell'
" Plug 'Shougo/deoplete.nvim'
" Plug 'davidhalter/jedi-vim'
" Plug 'gabrielelana/vim-markdown'
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'majutsushi/tagbar'
" Plug 'itchyny/lightline.vim'
" Plug 'maximbaz/lightline-ale'
" Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'delphinus/lightline-delphinus'
" Plug 'itchyny/lightline-powerful'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'Shougo/neoinclude.vim'
" Plug 'Shougo/neco-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'benmills/vimux'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'
Plug 'w0rp/ale'
" Plug 'Shougo/neoinclude.vim'
" Plug 'cloudhead/neovim-fuzzy'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'neomutt/neomutt.vim'
" Plug 'zchee/deoplete-jedi'
Plug 'dyng/ctrlsf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'felipec/notmuch-vim'
" Plug 'vim-scripts/bash-support.vim'
" Plug 'kshenoy/vim-signature'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
"*****************************************************************************
"*****************************************************************************

call plug#end()
