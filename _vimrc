"
" https://github.com/gmarik/vundle
" install: cd ~/.vim && git clone https://github.com/gmarik/vundle.git bundle/vundle
" 

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dsolstad/vim-wombat256i'
Bundle 'Wombat'
Bundle 'desert.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'FindFile'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vadv/rubycomplete'
"http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html
Bundle 'ervandew/supertab'
Bundle 'UltiSnips'
"http://fueledbylemons.com/blog/2011/07/27/why-ultisnips/
Bundle 'Rip-Rip/clang_complete'
Bundle 'AutoComplPop'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'inccomplete'
Bundle 'golden-ratio'
Bundle 'SyntaxComplete'
Bundle 'STL-Syntax'
Bundle 'abudden/TagHighlight'
Bundle 'autotags'
Bundle 'chazy/cscope_maps'
Bundle 'rdavison/clavim'

filetype plugin indent on

"
" clang_complete options (http://www.zwiener.org/vimautocomplete.html)
"
let g:clang_use_library = 1
" Complete options (disable preview scratch window)
"set completeopt = menu,menuone,longest
" Limit popup menu height
"set pumheight = 15
" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0 
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

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
syntax enable
set background=dark
"set background=light
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme desert
"colorscheme wombat

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

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
          \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
       \endif
endif

let g:load_doxygen_syntax=1

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

