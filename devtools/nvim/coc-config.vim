" ========== global config
let g:coc_global_extenstions = [
\ 'coc-pyright',
\ 'coc-pyls',
\ 'coc-json',
\ 'coc-git',
\ 'coc-explorer',
\ 'coc-highlight',
\ 'coc-fzf-preview',
\ ]
let g:coc_explorer_global_presets = {'basic': {'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'}}

" ========== config
set encoding=utf-8
set hidden
set updatetime=300      " having longer updatetime (default 4000 ms) leads to noticeable delay

if has('nvim-0.5.0') || has('patch-8.1.1564')
    set signcolumn=number
else
    set signcolumn=yes
endif

" ========== custom function
" command shortcut
function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" check back space
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" ========== keymap
" open the file explorer
nmap <space>e :CocCommand explorer --toggle --sources=buffer+,file+ --preset basic<CR>

" open the coc config fi
call SetupCommandAbbrs('C', 'CocConfig')

" use tab for trigger completion with characters ahead and navigate
" NOTE: use command ':verbose imap <tab>' to make sure the tab is not mapped
"       by other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
