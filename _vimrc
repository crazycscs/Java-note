

"以下是默认设置

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction





" 判断操作系统类型
if(has('win32') || has('win64'))
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif


" 判断是否处于GUI界面
if has('gui_running')
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" 设置通用缩进策略
set shiftwidth=4
set tabstop=4

set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=indent        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set noundofile              "保存文件时不生成备份
set nobackup       	         "no backup files
set nowritebackup  	         "only in case you don't want a backup file while editing
set noswapfile     	         "no swap files
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
"set showmatch               " 显示括号配对情况

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全


" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos
if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif


" 使用GUI界面时的设置
if g:isGUI
    " 启动时自动最大化窗口
    if g:isWIN
        au GUIEnter * simalt ~x
    endif
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    set guioptions+=c        " 使用字符提示框
    set guioptions-=m        " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
    set guioptions-=r        " 隐藏右侧滚动条
    set guioptions-=b        " 隐藏底部滚动条
    set showtabline=0        " 隐藏Tab栏
    set cursorline           " 高亮突出当前行
    "set cursorcolumn       " 高亮突出当前列
endif