set nocompatible
set nu
set t_Co=256

"source /usr/share/vim/google/google.vim
"source /usr/share/vim/google/magic.vim
"Glug youcompleteme-google
"Glug codefmt-google auto_filetypes+=blazebuild
"Glug piper plugin[mappings]='<leader>p'
"Glug relatedfiles plugin[mappings]='<leader>r'
"Glug g4
"Glug corpweb
"Glug blaze plugin[mappings]='<leader>b'
"Glug grok
"Glug autogen
"Glug fileswitch
"Glug outline-window
"Glug blazedeps
"Glug coverage
"Glug coverage-google
"Glug outline-window
syntax on

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-jp/cpp-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-unimpaired'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
"Plugin 'sso://user/dpyle/unite-codesearch.git'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'rhysd/vim-grammarous'

call vundle#end()
call glaive#Install()
filetype plugin indent on

" Basic Behavior
set ignorecase
set hidden
set undolevels=1000
set noerrorbells
set pastetoggle=<F7>

" Visual
set title
set list
set listchars=tab:»·,trail:·,extends:#,nbsp:· " Show me tabs and trailing
                                              "" whitespace set ruler
let &colorcolumn = join(map(range(1,256), '"+" . v:val'), ",")

if &t_Co > 2 || has("gui_running")
  syntax enable
  set background=dark
  let g:solarized_termtrans=1
  colorscheme solarized
  set hlsearch
endif

" Tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smartindent

" YCM configs
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}
" This can change the location list out from under me.  Instead, populate it
" manually using :YcmDiags.
let g:ycm_always_populate_location_list = 0
let g:ycm_open_loclist_on_ycm_diags = 0
nnoremap <leader>jd :YcmCompleter GoToImprecise<CR>
nnoremap <leader>je :YcmCompleter GoToDeclaration<CR>

set foldmethod=syntax

" For confilic on TAB key of YoucompleteMe and Ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" CodeSearch
noremap <silent> <leader>cos :CorpWebCs<Space>
noremap <silent> <leader>cof :CorpWebCsFile<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1

" CtrlP
let g:ctrp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore review
      \ -g ""'

" NERDTree
nmap <silent> <leader>h :NERDTreeToggle<CR>
nnoremap <F6> :NERDTreeToggle<CR>

" Gundo
nnoremap <silent> <leader>g :GundoToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" Airline
let g:airline_theme = 'dark'

" Tabs
nmap <silent> <leader>n :tabnew<CR>

" Y should work like D and C
nnoremap Y y$

" disable scrollbars in gvim
set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e

" CodeSearch Unite
" Start Insert
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 300

" highlight like my vim
let g:unite_cursor_line_highlight = 'CursorLine'

" format mru
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" set up coolguy arrow prompt
let g:unite_prompt = '➜ '

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_selecta'])

" Function that only triggers when unite opens
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()

  " exit with (double) tap esc
  nmap <buffer> <ESC> <Plug>(unite_exit)

  " Ctrl jk mappings
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  imap <buffer> <c-k> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)

  " refresh unite (also refreshes codesearch results)
  nmap <buffer> <C-l> <Plug>(unite_redraw)
  imap <buffer> <C-l> <Plug>(unite_redraw)

  " split control; opens results, I use <C-v> to open vertical splits often
  inoremap <silent><buffer><expr> <C-x> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-x> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
  nnoremap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')

endfunction

function! SearchWithWord(expansion)
  let word = expand(a:expansion)
  execute(":Unite -input=" . word . " -buffer-name=codesearch codesearch")
endfunction

" Mapping for starting unite-codesearch with the cursor word
nnoremap <silent> <leader>sw :call SearchWithWord("<cword>")<CR>
nnoremap <silent> <leader>sW :call SearchWithWord("<cWORD>")<CR>
nnoremap <silent> <leader>ss :<C-u>Unite -buffer-name=codesearch codesearch:!<CR>

" vim-signify
let g:signify_vcs_cmds = {'perforce':'DIFF=%d" -U0" citcdiff %f || [[ $? == 1 ]]'}
let g:signify_vcs_list = ['perforce']
let g:signify_realtime = 0
let g:signify_line_highlight = 0

hi SpellBad ctermbg=166

" LSP
au User lsp_setup call lsp#register_server({
    \ 'name': 'CiderLSP',
    \ 'cmd': {server_info->[
    \   '/google/bin/releases/editor-devtools/ciderlsp',
    \   '--tooltag=vim-lsp',
    \   '--noforward_sync_responses',
    \ ]},
    \ 'whitelist': ['c', 'cpp', 'proto', 'textproto', 'go'],
    \})
nnoremap gd   :LspDefinition<CR>  " gd in Normal mode triggers gotodefinition
nnoremap <F4> :LspReferences<CR>  " F4 in Normal mode shows all references

autocmd FileType markdown setlocal spell


" Vimrc shortcut
nnoremap <leader>eve :tabe $MYVIMRC<cr>
nnoremap <leader>sve :source $MYVIMRC<cr>

