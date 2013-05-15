"
" https://github.com/gmarik/vundle
" install: cd ~/.vim && git clone https://github.com/gmarik/vundle.git bundle/vundle
" 

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vadv/rubycomplete'
"http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html
Bundle 'SirVer/ultisnips'
"http://fueledbylemons.com/blog/2011/07/27/why-ultisnips/
Bundle 'majutsushi/tagbar'
Bundle 'xaizek/vim-inccomplete'
Bundle 'TagHighlight'
Bundle 'harleypig/vcscommand.vim'
Bundle 'basilgor/vim-autotags'
Bundle 'tpope/vim-surround'
" Bundle 'rdavison/clavim'
Bundle 'mileszs/ack.vim'
Bundle 'embear/vim-localvimrc'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/neocomplcache'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-repeat'
Bundle 'Raimondi/delimitMate'

filetype plugin indent on

" source: http://www.jonlee.ca/hacking-vim-the-ultimate-vimrc

set bs=2 "set backspace to be able to delete previous characters
"Enable line numbering, taking up 6 spaces
set number

"Turn off word wrapping
set wrap!

"Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
set expandtab "turn tabs into whitespace
set shiftwidth=4 "indent width for autoindent

let g:tex_flavor = "latex"

"use Groovy Syntay for gradle files  
au BufNewFile,BufRead *.gradle setf groovy

"Shortcut to auto indent entire file
nmap <F10> 1G=G
imap <F10> <ESC>1G=Ga

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set hlsearch
set ignorecase
set smartcase

" tell VIM to always put a status line in, even if there is only one window
 set laststatus=2

" Don't show the current command int he lower right corner.  In OSX, if this
" is set and lazyredraw is set then it's slow as molasses, so we unset this
 set showcmd

" Show the current mode
 set showmode 

 set lazyredraw

" Make the command-line completion better
set wildmenu

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" set the search scan to wrap lines
set wrapscan

"Set color scheme
set t_Co=256 "enable 256 colors in terminal
syntax enable
set background=dark
"set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"Enable indent folding
set foldenable
set fdm=syntax

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
 
"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

set textwidth=140

" Automatically read a file that has changed on disk
set autoread
 
set cindent
set enc=utf-8
set fenc=utf-8

"Set line numbering to take up 5 spaces
set numberwidth=5
"Highlight current line
set cursorline

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
" This wont work with YouCompleteMe !!!
"set cpoptions=ces$

"Turn on spell checking with Deutsch, Neue Rechtschreibung
set spell
set spelllang=de_20
set spelllang=en_us
set spellsuggest=9 "show only 9 suggestions for misspelled words

"vim-latex
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" if has("autocmd") && exists("+omnifunc")
"     autocmd Filetype *
"           \if &omnifunc == "" |
"         \setlocal omnifunc=syntaxcomplete#Complete |
"        \endif
" endif

let g:load_doxygen_syntax=1

" don't process .lvimrc commands, setting in sandbox 
let g:localvimrc_sandbox=0
" don't ask for loading a .lvimrc file
let g:localvimrc_ask=0

let g:CommandTMaxFiles=20000

" CtrlP scan unlimited files 
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit=0
" CtrlP doesn't change directory
let g:ctrlp_working_path_mode = ''

let g:ycm_complete_in_comments_and_strings=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0

let g:neocomplcache_enable_at_startup=0

" YouCompleteMe shortcuts
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
nnoremap <leader>jdc :YcmCompleter GoToDeclaration<CR> 
nnoremap <leader>jdf :YcmCompleter GoToDefinition<CR> 

" gvim stuff
if has('gui_running')
"Set the font and size
"set guifont=Lucida\ Console
"set guifont=Andale\ Mono\ 10
set guifont=Inconsolata\ 12

"Hide toolbar
set guioptions-=T

"Enable balloon tooltips on spelling suggestions and folds
function! FoldSpellBalloon()
let foldStart = foldclosed(v:beval_lnum )
let foldEnd = foldclosedend(v:beval_lnum)
let lines = []
" Detect if we are in a fold
if foldStart < 0
" Detect if we are on a misspelled word
let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
else
" we are in a fold
let numLines = foldEnd – foldStart + 1
" if we have too many lines in fold, show only the first 14
" and the last 14 lines
if ( numLines > 31 )
let lines = getline( foldStart, foldStart + 14 )
let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
let lines += getline( foldEnd – 14, foldEnd )
else
"less than 30 lines, lets show all of them
let lines = getline( foldStart, foldEnd )
endif
endif
" return result
return join( lines, has( 'balloon_multiline' ) ? '\n' : ' ' )
endfunction
set balloonexpr=FoldSpellBalloon()
set ballooneval
endif "gvim

