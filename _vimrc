set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dsolstad/vim-wombat256i'

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
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
"Warning: slows down reaction on curser movement (on Thinkpad X32)
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set lazyredraw

"Set color scheme
set t_Co=256 "enable 256 colors in terminal
colorscheme wombat256i
syntax enable

"Enable indent folding
set foldenable
set fdm=syntax

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

set cindent
"set cinoptions
set enc=utf-8
set fenc=utf-8

set nocp
set smartcase
set incsearch
set hlsearch

" --- OmniCppComplete ---
" http://vim.wikia.com/wiki/C%2B%2B_code_completion
" -- optional --
" auto close options when exiting insert mode
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,menuone,longest,preview
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" -- ctags --
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags
set tags+=~/.ctags/lib_cpp
set tags+=~/.ctags/gl_usr_include
set tags+=~/.ctags/opencv2_usr_local_include
set tags+=~/.ctags/opencv_usr_local_include
set tags+=~/.ctags/wx-2.8_usr_include
set tags+=~/.ctags/bullet_usr_local_include
set tags+=~/.ctags/glog_usr_local_include
set tags+=~/.ctags/boost_usr_local_include
set tags+=~/.ctags/osg-3.x_usr_local_include
set tags+=~/.ctags/sdl_usr_include
set tags+=~/.ctags/sfml_usr_include

"Set line numbering to take up 5 spaces
set numberwidth=5
"Highlight current line
set cursorline

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

" gvim stuff
if has('gui_running')
"Set the font and size
"set guifont=Lucida\ Console
set guifont=Andale\ Mono\ 12

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

