"
"+------------------------------------------------------------------------+"
"参考：http://www.ruanyifeng.com/blog/2018/09/vimrc.html  vim配置入门  阮一峰 
"+------------------------------------------------------------------------+"
"

"------------------------------------------------------------------------"
"<Vundle>
"---------------------------"
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/omnicppcomplete'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/taglist'
" Plugin 'cposture/vim-syntastic-generator'
Plugin 'Yggdroot/LeaderF'

call vundle#end()
filetype plugin indent on


let g:auto_save = 1

"----------------------------"
"</Vundle>
"------------------------------------------------------------------------"

"----------------------------"
"<quick key快捷键>
"------------------------------------------------------------------------"
map wb :w<CR>
"----------------------------"
"</quick key快捷键>
"------------------------------------------------------------------------"


"------------------------------------------------------------------------"
"<base config>
"---------------------------"


"encoding
set fileencodings=ucs-bom,utf-8,GB18030,gbk
set encoding=utf-8
set termencoding=utf-8

"背景使用黑色
set background=dark

"line number
set nu
"close show line number

"按下 Tab 键时，Vim 显示的空格数
set ts=4

set dictionary +=/usr/include


"under line
set cursorline

"支持使用鼠标。
"set mouse=a
set mouse=a

"highlight search word
set hlsearch

"highlight when input search
set incsearch

"no \n
"set nowrap


"----------------------------"
"</base config>
"------------------------------------------------------------------------"

"------------------------------------------------------------------------"
"<advanced config>
"---------------------------"
"

"enable syntax highlighting
syntax on

"把当前行的对齐格式应用到下一行(自动缩进）
set autoindent
"针对 C语言语法自动缩进
set cindent
"依据上面的对齐格式，智能的选择对齐方式
set smartindent

"set expandtab " space grid replace tab
"行之间交错时使用4个空格,这个可以在自动对齐的时候缩进一个tab，不设置会缩进两个tab
set shiftwidth=4
"设置退格键可用
set backspace=2

"按下 Tab 键时，Vim 显示的空格数
set tabstop=4

"由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格。
set expandtab
"Tab 转为多少个空格
set softtabstop=4

"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
set showmatch

"在编辑过程中，在右下角显示光标位置的状态行
set ruler

"检测文件的类型
filetype on

"Vim 需要记住多少次历史操作。
set history=1000

"只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set linebreak

"不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）。
set nobackup
"不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noswapfile

"自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autochdir

"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set autoread

"未知的设置
set laststatus=2
set mouse=a


"----------------------------"
"</advanced config>
"------------------------------------------------------------------------"





"------------------------------------------------------------------------"
"<newfile prefix>
"---------------------------"
" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call AddInfoCpp()" 
" 加入注释 
function AddInfoCpp()
    call setline(1,"// @") 
    call append(line("."),   "// @")
    call append(line(".")+1, "// @")
    call append(line(".")+2, "// @")
endfunction

"----------------------------"
"</newfile prefix>
"------------------------------------------------------------------------"



"------------------------------------------------------------------------"
"<show blank character>
"---------------------------"
"显示行首tab和行尾空白字符
set list
set listchars=tab:»\ ,trail:■,extends:>,precedes:<,nbsp:.
"set listchars=tab:»■,trail:■
"set listchars=tab:»\ ,trail:.,extends:>,precedes:<,nbsp:.
"set listchars=tab:›\ ,trail:.,extends:>,precedes:<,nbsp:.
"set listchars=tab:»-,trail:·,eol:¶,extends:>,precedes:<
"set listchars=tab:␣␣,trail:·,eol:¶,extends:>,precedes:<
"行首空格高亮显示
"highlight WhitespaceHEAD ctermbg= black guibg=black
"match WhitespaceHEAD /^\s\+/
"----------------------------"
"</show blank character>
"------------------------------------------------------------------------"

"------------------------------------------------------------------------"
"<color scheme>
"---------------------------"
"codedark
set t_Co=256
colo codedark
"----------------------------"
"</color scheme>
"------------------------------------------------------------------------"


"------------------------------------------------------------------------"
"<ctas generate command>
"---------------------------"
"
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ /usr/include
"
"---------------------------"
"</ctas generate command>
"------------------------------------------------------------------------"

"------------------------------------------------------------------------"
"<omnicppcomplete  cpp自动补全插件>
"---------------------------"
"加入tags地址
set tags+=~/.vim/.tags/usr/root.usr.include.tags
"----------------------------"
"</omnicppcomplete  cpp自动补全插件>
"------------------------------------------------------------------------"
"------------------------------------------------------------------------"
"<NerdTree>
"---------------------------"
" 设置NerdTree
map nerd :NERDTreeMirror<CR>
map nerd :NERDTreeToggle<CR>

""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree
"目录窗口在右边，不设置选项默认在左边, 0在左边, 1在右边
let NERDTreeWinPos=0
"----------------------------"
"</NerdTree>
"------------------------------------------------------------------------"
"

"------------------------------------------------------------------------"
"<supertab>
"---------------------------"
"
let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
"
"----------------------------"
"</supertab>
"------------------------------------------------------------------------"
"
"
"------------------------------------------------------------------------"
"<cscope>
"----------------------------"
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"生成文件的方法:生成文件的方法
"find $(pwd) -name *.cpp -o -name *.h > cscope.files
"cscope -Rbq
"----------------------------"
"</cscope>
"------------------------------------------------------------------------"

"------------------------------------------------------------------------"
"<taglist>
"----------------------------"
"let Tlist_Auto_Open=1 "auto open Tlist
"mlet Tlist_WinWidth = 40 "设置taglist窗口的宽度
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联
let Tlist_Compact_Format=1 "Hide help menu
"let Tlist_Sort_Type="name" "以名称排序，默认以出现顺序排序
let Tlist_Use_Right_Window=1 "窗口在右侧，默认在左侧
"let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的
let Tlist_File_Fold_Auto_Close = 1 "如果设置了显示多个文件的tags时，其他文件的tag折叠起来
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Horiz_Window=1 "将窗口开到当前窗口的下边
"----------------------------"
"</taglist>
"------------------------------------------------------------------------"
"------------------------------------------------------------------------"
"<winmanager--Fox>
"----------------------------"
let g:winManagerWindowLayout='FileExplorer|Tlist'
"----------------------------"
"</winmanager--Fox>
"------------------------------------------------------------------------"

"----------------------------"
"<vim打开文件光标自动定位到退出前的位置>"
"<https://blog.csdn.net/darennet/article/details/44340491>"
"----------------------------"
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"----------------------------"
"</>"
"----------------------------"

"------------------------------------------------------------------------"
"<个性化设置-放到最后>
"----------------------------"
".vimrc.custom文件放在打开vim时所在的目录下
if filereadable(".vimrc.custom")
    source .vimrc.custom
endif
"----------------------------"
"</个性化设置>
"------------------------------------------------------------------------"

