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
Plugin 'lifepillar/vim-solarized8'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'easymotion/vim-easymotion'
Plugin 'andymass/vim-matchup'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chip/vim-fat-finger'
Plugin 'SirVer/ultisnips'
Plugin 'christoomey/vim-sort-motion'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-peekaboo'
Plugin 'kien/ctrlp.vim'
Plugin 'markonm/traces.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'mhinz/vim-signify'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-syntastic/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-grammarous'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'vim-jp/cpp-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'wellle/targets.vim'
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'christianrondeau/vim-base64'
Plugin 'grailbio/bazel-compilation-database'
Plugin 'ojroques/vim-oscyank', {'branch': 'main'}
Plugin 'sainnhe/everforest'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" At work, or not:
if filereadable(expand('~/.vimrc_google_plugin'))
  " Google-only
  source ~/.vimrc_google_plugin
else
  " Non-Google only
  Plugin 'Valloric/YouCompleteMe'
  "Plugin 'ycm-core/YouCompleteMe'
  Plugin 'google/vim-glaive'
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-maktaba'
endif

call vundle#end()
filetype plugin indent on

if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set wrapscan
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
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let &colorcolumn = join(map(range(1,256), '"+" . v:val'), ",")
if &t_Co > 2 || has("gui_running")
  syntax on
  set background=dark
  let g:solarized_termtrans=1
  let g:one_allow_italics = 1
  "colorscheme solarized8
  colorscheme one
  "colorscheme solarized
  "colorscheme everforest
  "colorscheme gruvbox
  highlight SpellBad guifg=#eeeeee guibg=#ff0000
  set hlsearch
endif

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
let g:ycm_key_list_select_completion   = ['<C-j>', '<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<S-Tab>', '<Up>']
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>je :YcmCompleter GoToDeclaration<CR>

" For confilic on TAB key of YoucompleteMe and Ultisnips
"au! UltiSnips_AutoTrigger
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['python3']
let g:syntastic_yaml_checkers = ['yamllint']

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
let g:NERDTreeMinimalMenu=1
nmap <silent> <leader>d :NERDTreeToggle %<CR>
nmap <silent> <leader>h :NERDTreeToggleVCS <CR>
nnoremap <F6> :NERDTreeToggle<CR>

" Undo
nnoremap <silent> <leader>gu ::UndotreeToggle<CR>
nnoremap <F5> ::UndotreeToggle<CR>

" Airline
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
"let g:airline_section_b = ''
let g:airline_theme= 'one'
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
if filereadable(expand('~/.vimrc_google_cmd'))
  " Google-only
  source ~/.vimrc_google_cmd
else
  call glaive#Install()
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
nnoremap <leader>gp :!git push origin HEAD:refs/for/$(git rev-parse --abbrev-ref --symbolic-full-name @{u} <bar> cut -d/ -f 2) -o nokeycheck<cr>
nnoremap <leader>gitp :Git pull<cr>
nnoremap <leader>gitb :Git branch<cr>

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
" autocmd FileType go AutoFormatBuffer gofmt
" Bugs in vim 8.1, fixed in vim 8.2
autocmd FileType go set softtabstop=0

" Go-Vim
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_fmt_autosave = 1
let g:go_metalinter_autosave = 0
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ["govet" ,"errcheck","staticcheck","unused","gosimple","structcheck","varcheck","ineffassign","deadcode","typecheck","asciicheck","depguard","gofmt","goimports","importas","nolintlint","unconvert","unparam"]
let g:go_metalinter_autosave_enabled = g:go_metalinter_enabled
let g:go_list_type = 'quickfix'
let g:go_jump_to_error = 0
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r :GoReferrers<cr>
autocmd FileType go nnoremap <leader>gr :GoRename<CR>
autocmd Filetype go setlocal ts=4
autocmd Filetype python setlocal expandtab ts=4 softtabstop=4

" FZF
nnoremap <leader>f :FZF<cr>
nnoremap <leader>rg :Rg<cr>
nnoremap <leader>rgw :Rg <C-R><C-W><cr>
nnoremap <leader>ag :Ag<cr>
nnoremap <leader>agw :Ag <C-R><C-W><cr>

" vim-oscyank
vmap <leader>c <Plug>OSCYankVisual
let g:oscyank_max_length = 1000000
let g:oscyank_osc52      = "\x1b]52;c;%s\x07"  "
