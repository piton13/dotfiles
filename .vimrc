"  for Unix and OS/2:  ~/.vimrc
"  for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"  for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible              " be iMproved, required (to use VIM settings rather than VI)
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ============================ LIST OF PLUGINS ===============================
" (just put path after github.com/ and before # inside of the single quotes)
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" NERD tree to explore filesystem
Plugin 'scrooloose/nerdtree'
" Lightline.vim - for configuration of statusline/tabline
" Plugin 'itchyny/lightline.vim'
" Fonts for lightline configuration
Plugin 'powerline/fonts'
" Plugin for status line stylization
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Color Dracula theme
Plugin 'dracula/vim'
" emmet-vim plugin
Plugin 'mattn/emmet-vim'
" editorconfig vim plugin
Plugin 'editorconfig/editorconfig-vim'
" vim-jsbeautify
Plugin 'maksimr/vim-jsbeautify'
" Syntax checking plugin
Plugin 'vim-syntastic/syntastic'
" TypeScript syntax for Vim
Plugin 'leafgarland/typescript-vim'
" SCSS lint checker
Plugin 'gcorne/vim-sass-lint'
" FuzzyFinder
Plugin 'vim-scripts/FuzzyFinder'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9' "Used for fuzzyFinder
" UltiSnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" angular2 snippets
" Plugin 'mhartington/vim-angular2-snippets'
" For text surrounding
Plugin 'tpope/vim-surround'
" Git gutter plugin
Plugin 'airblade/vim-gitgutter'
" Git integration
Plugin 'tpope/vim-fugitive'
" Multi cursor plugin
Plugin 'terryma/vim-multiple-cursors'
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"===================== END LIST ====================================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"================= VUNDLE END =====================================

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
" Highlight dynamically as pattern is typed
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

if !has('gui_running')
  set t_Co=256
endif
" enable Dracula theme
" syntax on
" color dracula
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set hlsearch

set number " show line numbers
set encoding=utf-8 " set file encoding
scriptencoding utf-8
set fileencoding=utf-8
set fileformat=unix " set unix line ending

filetype indent on
" set filetype=html (ft=html)
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Optimize for fast terminal connections
set ttyfast
" Change mapleader
" let mapleader=","
" Show 'invisible' characters
set lcs=trail:·,eol:¬,nbsp:_
set list
" Ignore case of searches
set ignorecase
" Always show status line
set laststatus=2
set showtabline=2 " Always display the tabline, even if there is only one tab
" Show the current mode
set showmode
" Show the filename in the window titlebar
" set title
" Show the (partial) command as it’s being typed
set showcmd
" Set stylish as color scheme
" set background=dark
" colorscheme tomorrow

" ==================== CONFIGURATION PLUGINS GLOBAL VARIABLES =====================
"===== Vim-Airline ===========================
" set guifont=Droid\ Sans\ Mono\ for\ Powerline " by default vim uses font for my terminal
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline " by default vim uses font for my terminal
function! AirlineInit()
"   let g:airline_section_a = airline#section#create(['mode',' ','branch'])
"   let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
  let g:airline_section_b = airline#section#create_left(['branch','hunks'])
"   let g:airline_section_c = airline#section#create(['filetype'])
"   let g:airline_section_x = airline#section#create(['%P'])
"   let g:airline_section_y = airline#section#create(['%B'])
"   let g:airline_section_z = airline#section#create_right(['%l','%c'])
"   '%f' - shows file name with extention
"   '%{getcwd()}' - shows absolute path for current file
"   '%t' - shows file name with extention
endfunction
autocmd VimEnter * call AirlineInit()

let g:airline_detect_modified=1 " enable modified detection
let g:airline_detect_paste=1 " enable paste detection
let g:airline_detect_spell=1 " enable spell detection
let g:airline_inactive_collapse=1
let g:airline_theme='dark'

let g:airline#extensions#tabline#enabled = 1 " To automatically display all buffers
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 20 " truncate long branch names to fixed length
let g:airline#extensions#branch#format = 2 " To truncate all path sections but the last one

let g:airline#extensions#syntastic#enabled = 0 " To disable syntastic integration

let g:airline#extensions#whitespace#enabled = 1 " To enable detection of whitespace errors
" let g:airline_theme='solarized'
" let g:cobalt2 = 1
let g:airline_powerline_fonts = 1
" let g:airline_symbols_ascii = 1

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" Vim-Airline End ============================
"===== Multi cursors =========================
let g:multi_cursor_use_default_mapping=0 " disable default keybindings
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-j>'
let g:multi_cursor_start_word_key='g<C-j>'
" Multi cursors End ==========================
"===== UltiSnips =============================
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" UltiSnips End ==============================
"===== EMMET (Use Tab+, for expansion) =====
let g:user_emmet_leader_key='<Tab>'
" EMMET End =====
"===== NERDTree configuration =====
" autocmd vimenter * NERDTree " to open a NERDTree automatically when vim starts up
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " to close vim if the only NERDTree window opened
map <C-n> :NERDTreeToggle<CR>
" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('html', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('scss', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('css', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts', 'blue', 'none', '#3366ff', '#151515')
let g:NERDTreeDirArrowExpandable = '+' " change default arrows
let g:NERDTreeDirArrowCollapsible = '-'
" NERDTree END =====
"===== Editorconfig configuration =====
" let g:EditorConfig_exec_path = '~/.editorconfig'
" :EditorConfigReload - use the command to load new configuration after modifying editorconfig file
let g:EditorConfig_max_line_indicator="fill"
" configuration of editorconfig for jsBeautifier (commented because does not work)
" let g:EditorConfig_exec_path = '~/.editorconfig'
" Editorconfig END =====
"===== js-beautify configuration =====
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
" js-beautify END =====
"===== SYNTASTIC Configuration =====
" Run:
"     :SyntasticInfo to see available checkers
"     :SyntasticCheck to invoke syntax check on the current file
"     :Errors to move between lines with errors
"     :lnext or :lprev to jump between lines with errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_html_htmlhint_args = "--config .htmlhintrc"
let g:syntastic_scss_checkers=['stylelint']
" let g:syntastic_scss_stylelint_args = "--syntax scss"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsc', 'tslint']
let g:syntastic_typescript_tslint_args = "--config tslint.json"
let g:typescript_compiler_binary = 'tsc'
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" SYNTASTIC End =====
"===== GitGutter Configuration =======================
set updatetime=250 " to decreade delay of showing gutter icons
" nmap <C-A-T> :call GitGutterLineHighlightsToggle()<CR>
" nmap <C-p><C-h> <Plug>GitGutterPreviewHunk
" nmap <C-u><C-h> <Plug>GitGutterUndoHunk
let g:gitgutter_highlight_lines = 1 " to turn on highlighting by default
" GitGutter End ======================================

" ==================== Keys Remapping ================================
" remapping of ex commangs
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
