"-----------------------------------------------------------------------
" フォント設定:

" Windows用
" set guifont=ＭＳ_ゴシック:h10:cSHIFTJIS
" set printfont=ＭＳ_明朝:h11:cSHIFTJIS

set guifont=M+\ 1mn\ Medium\ 8
" if has("gui_gtk")
" 	set guifont=Kochi\ Gothic\ 12
" else
" 	set guifontset=-*-kochi\ fixed-medium-r-*-*-12-*-*-*-c-*-jisx0208.1983-*
" endif

"-----------------------------------------------------------------------
" ウインドウに関する設定:

"gui
" スタート時のウィンドウ位置
winpos 175 0
" ウインドウの幅
set columns=95
" ウインドウの高さ
set lines=59
" コマンドラインの高さ
set cmdheight=1

set ambiwidth=double

" set imactivatekey=S-space

" 画面色
colorscheme koehler
