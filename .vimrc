
call plug#begin('~/.vim/plugged')

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
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let mapleader=" "

autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'pic'
" let g:mdip_imgname = 'image'


"让 Y 和 D 一样, 要不然 Y 的本意和 yy 一样.
map Y y$
" 禁止生成 swap 恢复文件 现在计算机鲜少崩溃了，可以禁用此功能
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
" 设置复制等操作到剪切板
set clipboard=unnamed
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

" 使用 ss 启用
nmap ss <Plug>(easymotion-s2)
""""""""""""""""""""""""""""""""""""""Plugin""""""""""""""""""""""""""""""""""""""""""""""
