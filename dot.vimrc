"-----------------------------------------------------------------------
"       OPTIONS SECTION
"-----------------------------------------------------------------------

" No履歴
set viminfo=%,'50
" カーソル周り
set scrolloff=3 sidescrolloff=6 sidescroll=1
" タブ幅etc.
set tabstop=8 shiftwidth=4 expandtab
" 行番号
set number
" コマンドラインの高さ
set cmdheight=1
" タブ等を表示
set list
" 2画面以上のときにステータス行を表示
set laststatus=1
" タブや行末空白の表示用文字
set listchars=tab:.\ ,trail:@
" ヴィジュアルブロックモード中は行末気にしない
set virtualedit=block
" テキスト挿入中の自動折り返しを日本語に対応させる
" 番号付きリストを認識
" コメント整形後には自動的にコメント文字を挿入
" 1文字の単語の後では折り返さない
" テキストの整形では，1行目と2行目は違うインデント
" 自動折り返しは余計
set formatoptions=mBnoqr12
" 関数の戻り値は関数名と同じ列
" 長すぎる引数は括弧に合わせる
set cinoptions=t0,(0
" 補完は一致箇所まで
set wildmode=longest:list
" :make等で自動保存
set autowrite
set hidden
set lazyredraw
set suffixes+=Makefile,tags,.a,.aux,.bbl,.blg,.bz,.bz2,.class,.cmi,.cmo,.cmx,.dvi,.fas,.fasl
set suffixes+=.idx,.ilg,.ind,.log,.lib,.lzh,.mak,.obj,.out,.pdf,.scn,.so,.tmp,.toc,.zip
set wildignorecase
set visualbell
" ページ移動してもカーソルは同じ列
set nostartofline
set whichwrap+=<,>,h,l,[,]
set display=lastline
set diffopt+=context:1
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions+=resize,winpos
" set makeprg=/cygwin/bin/make\ -kr
"set makeef=/Docume~1/nodakai/LocalS~1/Temp/makeef.txt
" set shellpipe=2>\&1\|/tex/bin/nkf\ -w>%s
" set grepprg=/cygwin/bin/grep\ -nH\ $*
set history=50
set incsearch ignorecase smartcase
"set migemo
" try
" 	set migemodict=$VIM/dict/migemo-dict
" finally
" 	"
" endtry
set backup
set updatetime=2000
set lispwords-=if
set lispwords+=define-modify-macro,syntax-rules
set foldmethod=marker
set path+=/usr/local/include

" set runtimepath+=$HOME/vimfiles/chalice

set tags+=.tags
set nobomb ambiwidth=double stal=2

" ----------------------------------------------------------------------
"       PLUGIN VARIABLES SECTION
" ----------------------------------------------------------------------

let chalice_username = ''
let chalice_usermail = ''
let chalice_columns = 140
let chalice_reloadinterval_boardlist = 864000
let chalice_reloadinterval_threadlist = 43200 " 半日間
let chalice_threadinfo_expire = 21600 " 6時間
let chalice_startupflags = 'bookmark'
let chalice_preview = 0

let plugin_autodate_disable = 1
let loaded_bobcvs = 1
let plugin_dicwin_disable = 1
let loaded_drawit = 1
"let plugin_hz_ja_disable = 1
"let plugin_verifyenc_disable = 1
" let plugin_cmdex_disable = 1
let plugin_format_disable = 1
" ぶら下がり可能幅
"let format_allow_over_tw = 2
" 両方MB文字のときのみ直連結
"let format_join_spaces = 1

let g:Tex_CompileRule_dvi = 'platex -interaction=nonstopmode -kanji=utf8 $*'


" ----------------------------------------------------------------------
"       FUNCTION SECTION
" ----------------------------------------------------------------------

function! AutoUp()
	let &ro = &ro
"	if expand('%') =~ g:svbfre && !&readonly && &buftype == ''
	if !&readonly && &buftype == ''
		try
			if b:autoup
				set noswapfile nowritebackup
				silent update
			endif
		catch
			let b:autoup = 0
		endtry
	endif
endfunction
" let g:svbfre = '.\+'

" Dvorak化に伴う移動キーの変化と帳尻合わせ

fu! DVO()
if s:dvorak != 1
	let s:dvorak = 1
" h<-b<-j<-h  H<-B<-J<-H  gH<->gJ    gj<-<C-H>
" k<->t       K<->T       gk<-<C-T>
" l<->n       L<->N       ;<->:
" 以下，h の代わりには b を使った，と読む
	nn b h
	nn j b
	nn h j
	nn B H
	nn J B
"	nn <silent> H :call DoRangeJoin("")<CR>
	nn H J
	nn gJ gH
	nn gH gJ
	nn <C-H> gj
	nn t k
	nn k t
	nn T K
	nn K T
	nn <C-T> gk
	nn n l
	nn l n
	nn N L
	nn L N
	nn : ;
	nn ; :

	vn b h
	vn j b
	vn h j
	vn B H
	vn J B
"	vn <silent> H <Esc>:call DoJoinRange(line("'<"), line("'>"))<CR>
	vn H J
	vn gJ gH
	vn gH gJ
	vn <C-H> gj
	vn t k
	vn k t
	vn T K
	vn K T
	vn <C-T> gk
	vn n l
	vn l n
	vn N L
	vn L N
	vn : ;
	vn ; :

	ono b h
	ono j b
	ono h j
	ono B H
	ono J B
	ono H J
	ono t k
	ono k t
	ono T K
	ono K T
	ono n l
	ono l n
	ono N L
	ono L N
	ono : ;
	ono ; :

	nun <C-J>
	nun <C-K>
	vu <C-J>
	vu <C-K>
endif
endfunction

function! QWE()
if s:dvorak == 1
	let s:dvorak = 0
	nun b
	nun j
	nun h
	nun B
	nun J
	nun H
	nun gJ
	nun gH
	nun <C-H>
	nun t
	nun k
	nun T
	nun K
	nun <C-T>
	nun n
	nun l
	nun N
	nun L
	nun ;
	nun :

	vu b
	vu j
	vu h
	vu B
	vu J
	vu H
	vu gJ
	vu gH
	vu <C-H>
	vu t
	vu k
	vu T
	vu K
	vu <C-T>
	vu n
	vu l
	vu N
	vu L
	vu ;
	vu :

	ou b
	ou j
	ou h
	ou B
	ou J
	ou H
	ou t
	ou k
	ou T
	ou K
	ou n
	ou l
	ou N
	ou L
	ou ;
	ou :

	nn <C-J> gj
	nn <C-K> gk
	vn <C-J> gj
	vn <C-K> gk
"	nn <silent> J :call DoRangeJoin("")<CR>
"	vn <silent> J <ESC>:call DoJoinRange(line("'<"), line("'>"))<CR>
endif
endfunction

" ----------------------------------------------------------------------
"       COMMAND SECTION
" ----------------------------------------------------------------------

com Edvimrc split $HOME/.vimrc
" com Jman new|lcd $VIMRUNTIME/doc_jp
com -nargs=1 -complete=file RmFile cal delete("<args>")
com -nargs=1 -complete=file W3mDump execute ".-1r!w3m -dump <args>"
com Han set hlsearch|let @/ = "[ -~\t]\\+"
com Zen set hlsearch|let @/ = "[^ -~\t]\\+"
com BreakatPunc execute 's/\(\(\.\|,\|?\|:\|;\|!\))\?\)\s\+/\1\r/g'
com TrailSpDel execute '%s/\s\+$//g'
" com OnLispA execute '%s/\\verb\(.\)\(.\{-}\)\1/<code>\2<\/code>/g'
" com OnLispB execute '%s/\\begin{verbatim}/<\/p>\r<pre>/'
" com OnLispC execute '%s/\\end{verbatim}/<\/pre>\r<p>/'
com Bettari set scrollbind!|set scrollbind?
com FindAlternateGerman set hlsearch|let @/ = "ae\\|oe\\|ue\\|ss\\|:"
com EndAutoUp let b:autoup = 0

" ----------------------------------------------------------------------
"       AUTOCOMMAND SECTION
" ----------------------------------------------------------------------

if has("autocmd")
au BufNewFile,BufRead *.as se ft=actionscript
au BufNewFile,BufRead *.plt se ft=gnuplot
au BufNewFile,BufRead *.cs compiler cs
augroup MyAutoCmd
autocmd BufRead dvlguide.tex setlocal makeprg=latex\ -interaction=nonstopmode\ $*
autocmd BufRead AIM*.tex setlocal makeprg=latex\ -interaction=nonstopmode\ $*
autocmd BufNewFile *.tex r ~/vimfiles/skeleton/skel.tex|1d
autocmd BufNewFile *.pas,*.p r ~/vimfiles/skeleton/skel.pas|1d
autocmd BufNewFile *.*htm* r ~/vimfiles/skeleton/skel.html|1d
autocmd BufNewFile *.w r ~/vimfiles/skeleton/skel.w|1d
autocmd BufNewFile *.web r ~/vimfiles/skeleton/skel.web|1d
autocmd BufNewFile *.scm r ~/vimfiles/skeleton/skel.scm|1d
autocmd BufReadPost */docj/*.txt setlocal ft=help isk=!,#-),+-{,}-~ shiftwidth=8 tabstop=8 softtabstop=8
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd BufReadPost * let b:autoup = 1
autocmd CursorHold * call AutoUp()
augroup END
endif

" ----------------------------------------------------------------------
"       KEYMAPPING SECTION
" ----------------------------------------------------------------------

let mapleader = ","
nn <Leader><Leader> <Leader>
" カレントファイルのディレクトリに関わること
nn <Leader>c :cd<Space><C-R>=expand('%:~:.:h')<CR><CR>
nn <Leader>e :e<Space><C-R>=expand('%:~:.:h')<CR>/
cno <Leader>d <C-R>=expand('%:~:.:h')<CR>/
" Quick-fix
nn <Leader>m :mak<Up><CR>
nn <Leader>l :cl!<CR>
nn <Leader>n :cn<CR>
nn <Leader>p :cp<CR>
" 検索時の強調表示切り替え
nn <Leader>h :se<Space>hlsearch!<CR>
" バッファ操作
nn <C-N> :bn<CR>
nn <C-P> :bp<CR>
nn <C-D> :bd<CR>
" Scratchバッファ
nn <Leader>s :new<CR>:setl<Space>bt=nofile<Space>bh<Space>noswf<CR>
" バックアップとらないとき
nn <Leader>B :se backup!<CR>:se backup?<CR>
" 表示上の行移動
nm <C-J> gj
nm <C-K> gk
vm <C-J> gj
vm <C-K> gk
" スクロールがちまちまではダメ
nn <C-E> 2<C-E>
nn <C-Y> 2<C-Y>
" バッファ番号も
nn <C-G> 2<C-G>
" less っぽく
nn <Space> <C-F>
vn <Space> <C-F>
nn <C-Space> <C-B>
vn <C-Space> <C-B>
" 行末までヤンク
nn Y y$
" 空行挿入
nm <CR> o<ESC>
" 大文字変換
"ino <C-F> <Esc>gUiw`]a
inoremap <C-U> <Nop>
" tabs
nn <Leader>t :tab split<CR>

" ----------------------------------------------------------------------
"       SHORT SCRIPT SECTION
" ----------------------------------------------------------------------

" スタート時のカレントディレクトリはホームディレクトリ
" if argc() == 0
" 	cd $HOME
" en

" Dvorakキー化の修正
let s:dvorak = 0
" cal DVO()

" let $PATH=$PATH . ';/cygwin/bin;/cygwin/usr/bin'

se autoread

set guioptions+=M
set guioptions-=e
set guioptions-=m
set guioptions-=T
syntax on
filetype plugin indent on
