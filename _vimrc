"tips1：:e 可以在每次修改之后自动载入文件，而不需要关闭文件再打开文件！
"http://www.oschina.net/code/snippet_574132_13357
"http://s1099.iteye.com/blog/1447662
"打造属于自己的Vim神器http://zilongshanren.com/blog/2013/01/15/vim-the-killer/
"markdown + pandoc + makefile + git(github)搭建免费个人wiki  :http://www.mikewootc.com/wiki/tool/sitebuild/mikewiki.html
"http://www.vimbits.com/
"https://github.com/beiyuu/vimfiles/blob/master/_vimrc



set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin        "兼容windws命令

"插件管理pathogn生效
"call pathogen#infect()

set smartindent
filetype on
filetype plugin on
filetype plugin indent on
set number
syntax enable
syntax on

"禁止生成临时文件 
set nobackup  
"关掉错误提示音 
set vb t_vb=
"搜索忽略大小写  
set ignorecase

""""""主题和字体
colorscheme desert
set guifont=黑体:h14:cANSI
set guifontwide=Consolas:h12:cGB2312

"编码问题及菜单乱码解决
"参考http://blog.csdn.net/laruence/article/details/2603031
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

if has("win32")
	set fileencoding=chinese
else 
	set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码  
language messages zh_CN.utf-8 



"设置自动折行
set textwidth=78 
" 如遇Unicode值大于255的文本，不必等到空格再折行。
"set formatoptions+=m
set formatoptions=croqn2mB1 
" 合并两行中文时，不在中间加空格：
"set formatoptions+=B
set nowrap

""""""""IME设置
"http://blog.csdn.net/lixiaodong037/article/details/6181531
"比较智能的设置，会记录输入法状态
set iminsert=0 imsearch=0
if has('multi_byte_ime')
	"未开启IME时光标背景色
	hi Cursor guifg=bg guibg=Orange gui=NONE
	"开启IME时光标背景色
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" 关闭Vim的自动切换IME输入法(插入模式和检索模式)
	set iminsert=0 imsearch=0
	" 插入模式输入法状态未被记录时，默认关闭IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif


""""""""latex suite 设置
"set shellslash
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"set sw=2
"set iskeyword+=:
"下面这句是为了改掉每次输完｛｝自动加个<++>
"如果不改的化直接ctrl+j可以跳转到这里，然后会自动删除掉<++>
"let g:Imap_UsePlaceHolders=0
"修改默认用xelatex编译
let g:Tex_CompileRule_pdf = 'xelatex --src-specials -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'AcroRd32'
"""""""""

""""""""""vim-pandoc设置

"设置comment方式，找了很久，呵呵
setlocal commentstring=<!--%s-->
setlocal comments=s:<!--,m:\ \ \ \ ,e:-->

let g:snips_author='songliheng'
nmap <leader>p !pandoc -o %:r.pdf % --latex-engine xelatex --number-sections<CR>
map <C-w> :!pandoc % -o %:r.html -S -s -N -c github.css<CR>

"nmap <leader>hl !pandoc % -o %:r.html -Ss -N -c github.css <CR>
""""""""""

"**************************************************
"           保存md文件自动更新日期                *             
"                                                 *
"**************************************************



nmap <F8> :NERDTree <CR>

"ctrl+w+h 左边窗口  ctrl+w+l右边窗口
"光标移动到右边  :q关闭nerdtree
"autocmd vimenter * NERDTree
"
"**************************************************



"**************************************************
"           保存md文件自动更新日期                *             
"                                                 *
"**************************************************
" 更新日期: 会将.mkd文件中的<!---date-->或者<!---date:yyyy.mm.dd-->替换为当前日期
" 有了这个就很容易实现在make时候向html中更新日期.


"**************************************************
"<!--date-->
"
"
"


"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>


"受http://beiyuu.com/git-vim-tutorial/这篇文章启发，用Vundle管理插件
"Vundle Settings {
set rtp+=vimfiles/bundle/vundle/
call vundle#rc()

