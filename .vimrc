
call plug#begin()

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'ferrine/md-img-paste.vim'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ybian/smartim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

let mapleader=" "

let NERDTreeMinimalUI = 1
autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'pic'
" let g:mdip_imgname = 'image'


"不显示文档总字数
let g:airline#extensions#wordcount#enabled = 0
"不显示文件编码（Windows系统）
let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
"设置tagber对于markdown的支持
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
 \ }
"取消显示warning部分
let g:airline_section_warning = ''
"取消显示section_b
let g:airline_section_b = ''
"section_c显示为tagbar检索出来的标题
let g:airline_section_c = airline#section#create(['tagbar'])
"section_x显示文件名
let g:airline_section_x = '%{expand("%")}'
"section_y显示时间
let g:airline_section_y = airline#section#create(['%{strftime("%D")}'])
"section_z显示日期
let g:airline_section_z = airline#section#create(['%{strftime("%H:%M")}'])
"激活tagbar扩展
let g:airline#extensions#tagbar#enabled = 1
let g:smartim_default = 'com.apple.keylayout.ABC'

"让 Y 和 D 一样, 要不然 Y 的本意和 yy 一样.
map Y y$
" 显示行号
set number
" Tab键的宽度为 4
set tabstop=4
" 统一缩进为 4
set softtabstop=4
" 禁止生成 swap 恢复文件
" 早期计算机经常崩溃，vim 会自动创建一个 .swp 结尾的文件
" 崩溃重启后可以从 .swap 文件恢复
" 现在计算机鲜少崩溃了，可以禁用此功能
set noswapfile
" vim 内部使用的编码，默认使用 latin1，改成通用的 utf8 编码，避免乱码
"set encoding=utf-8
" 文件编码探测列表
" vim 启动的时候会依次使用本配置中的编码对文件内容进行解码
" 如果遇到解码失败，则尝试使用下一个编码
" 常见的乱码基本都是 windows 下的 gb2312, gbk, gb18030 等编码导致的
" 所以探测一下 utf8 和 gbk 足以应付大多数情况了
set fileencodings=utf-8,gb18030
" 在插入模式按回车时 vim 会自动根据上一行的缩进级别缩进
set autoindent
" 修正 vim 删除/退格键行为
" 原生的 vim 行为有点怪：
" 如果你在一行的开头切换到插入模式，这时按退格无法退到上一行
" 如果你在一行的某一列切换到插入模式，这时按退格无法退删除这一列之前的字符
" 如果你开启了 autoindent，按回车时 vim 会根据上一行自动缩进，这时按退格无法删除缩进字符
" 通过设置 eol, start 和 indent 可以修正上述行为
set backspace=eol,start,indent
" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2
" 高亮第 80 列，推荐
set colorcolumn=80
" 高亮光标所在行，推荐
set cursorline
" 设置复制等操作到剪切板
set clipboard=unnamed
" 搜索高亮
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 在搜索的时候更加精准
set smartcase
" 模糊查询时高亮
set incsearch
" color  开启语法高亮
syntax on
colorscheme molokai
" fileType 能自动识别所使用语言的缩紧
filetype on
filetype indent on 
filetype plugin on
" 滚动最底下，还有3行时开始滚动
set scrolloff=3
" 取消撤销操作
nnoremap U <C-r>
" 退出Vim
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
" 行首行尾
nnoremap nn ^
nnoremap mm $

" 复制粘贴剪贴板
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+p
" 防止按leader键乱移动
nnoremap <SPACE> <nop>

"""""""""""""""""""""""""""""""""""""Plugin""""""""""""""""""""""""""""""""""""""""""""""""
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
autocmd VimEnter * NERDTree

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" 使用 ss 启用
nmap ss <Plug>(easymotion-s2)
""""""""""""""""""""""""""""""""""""""Plugin""""""""""""""""""""""""""""""""""""""""""""""
