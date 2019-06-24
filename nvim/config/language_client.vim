" language_client.vim contains vim settings specific to the language
" client plugin

" language server commands
" \ 'rust': ['rustup', 'run', 'stable', 'rls'],
" \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
" \ 'cpp': ['clangd'],
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'python': [g:current_pyls],
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ }
" \ 'python3': ['/home/cyrano5614/miniconda3/envs/gen3/bin/pyls'],
let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build'],
            \ 'rust': ['Cargo.toml', 'build'],
            \ }

" let g:LanguageClient_diagnosticsEnable = 1
 set completefunc=LanguageClient#complete
" note that you must keep `noinsert` in completeopt, you must not use
" `longest`. The others are optional. Read `:help completeopt` for
" more info
set completeopt=noinsert,menuone,noselect
" set omnifunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
