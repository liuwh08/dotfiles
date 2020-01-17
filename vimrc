set nocompatible
set t_Co=256
set encoding=utf-8

syntax on

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"Plugin 'prabirshrestha/async.vim'
"Plugin 'prabirshrestha/asyncomplete-lsp.vim'
"Plugin 'prabirshrestha/asyncomplete.vim'
"Plugin 'prabirshrestha/vim-lsp'
Plugin 'bogado/file-line'
Plugin 'L9'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'andymass/vim-matchup'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'chip/vim-fat-finger'
Plugin 'christoomey/vim-sort-motion'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-peekaboo'
Plugin 'kien/ctrlp.vim'
Plugin 'markonm/traces.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'mhinz/vim-signify'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-grammarous'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-jp/cpp-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'wellle/targets.vim'

" At work, or not:
if filereadable(expand('~/.at_google'))
  " Google-only
  source ~/.vimrc_local
else
  " Non-Google only
  "Plugin 'Valloric/YouCompleteMe'
  Plugin 'ycm-core/YouCompleteMe'
  Plugin 'SirVer/ultisnips'
  Plugin 'scrooloose/syntastic'
  Plugin 'google/vim-glaive'
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-maktaba'




  call glaive#Install()
endif

call vundle#end()
filetype plugin indent on

" Basic Behavior
set hidden
set undolevels=1000
set noerrorbells
set pastetoggle=<F7>

" Visual
set title
set list
set listchars=tab:»·,trail:·,extends:#,nbsp:· " Show me tabs and trailing
                                              "" whitespace set ruler
" Tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set autoindent
set smartindent
set nojoinspaces

" Searches
set ignorecase
set smartcase
set magic
set incsearch
set nowrapscan
set gdefault

" Command Completion
set wildmenu
set wildmode=longest:full,full

" Allow backspace over everything
set backspace=indent,eol,start

" Easier to indent visual blocks.
vnoremap > >gv
vnoremap < <gv

" Folding
set foldmethod=syntax
set foldnestmax=10
set foldlevel=99

" Split direction
set splitright
set splitbelow

" Line Numbers
set number
set numberwidth=4
set scrolloff=3
set ruler

" Color
let &colorcolumn = join(map(range(1,256), '"+" . v:val'), ",")
if &t_Co > 2 || has("gui_running")
  syntax enable
  set background=dark
  let g:solarized_termtrans=1
  colorscheme solarized
  set hlsearch
endif
syntax on

"set diffopt=filter,vertical
"if has('nvim-0.3.2') || has('patch-8.1.0360')
    "set diffopt+=internal,algorithm:histogram,indent-heuristic
"endif

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 0
let delimitMate_excluded_regions = 0

" Peekaboo
let g:peekaboo_window = 'vertical botright 30new'
let g:peekaboo_delay = 750

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

" For confilic on TAB key of YoucompleteMe and Ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['python3']

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#branch#use_vcscommand = 1

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

" Unite
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

  " refresh unite (also refreshes results)
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


" At work, or not:
if filereadable(expand('~/.at_google'))
  " Google-only
  source ~/.vimrc_local_cmd
endif

" vim-signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 0
let g:signify_line_highlight = 0

" Avoid piling up fugitive buffers
augroup fugitive
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

hi SpellBad ctermbg=166

autocmd FileType markdown setlocal spell

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.dotfiles/config/i3/config set filetype=i3config
aug end


" Vimrc shortcut
nnoremap <leader>eve :tabe $MYVIMRC<cr>
nnoremap <leader>sve :source $MYVIMRC<cr>

" Easier to indent visual blocks.
vnoremap > >gv
vnoremap < <gv

" Autoformatter
autocmd FileType go AutoFormatBuffer gofmt
