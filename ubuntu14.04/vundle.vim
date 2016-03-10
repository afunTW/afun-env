set nocompatible              " 去除VI一致性,必須
filetype off                  " 必須

" 設置包括vundle和初始化相關的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 另一種選擇, 指定一個vundle安裝插件的路徑
"call vundle#begin('~/some/path/here')
" 讓vundle管理插件版本,必須
Plugin 'VundleVim/Vundle.vim'

" 以下範例用來支持不同格式的插件安裝.
" 請將安裝插的命令放在vundle#begin和vundle#end之間.

" Github上的插件
" 格式為 Plugin '用戶名/插件倉庫名'
Plugin 'tpope/vim-fugitive'

" 來自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名稱' 實際上是 Plugin 'vim-scripts/插件倉庫名' 只是此處的用戶名可以省略
Plugin 'L9'

" 由Git支持但不再github上的插件倉庫 Plugin 'git clone 後面的地址'
Plugin 'git://git.wincent.com/command-t.git'

" 本地的Git倉庫(例如自己的插件) Plugin 'file:///+本地插件倉庫絕對路徑'
" Plugin 'file:///home/gmarik/path/to/plugin'

" 插件在倉庫的子目錄中.
" 正確指定路徑用以設置runtimepath. 以下範例插件在sparkup/vim目錄下
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" 安裝L9，如果已經安裝過這個插件，可利用以下格式避免命名衝突
Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面這行之前
call vundle#end()            " 必須
filetype plugin indent on    " 必須 加載vim自帶和插件相應的語法和文件類型相關腳本

" 忽視插件改變縮進,可以使用以下替代:
"filetype plugin on

" 簡要幫助文檔
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安裝插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地緩存
" :PluginClean      - 清除未使用插件,需要確認; 追加 `!` 自動批准移除未使用插件

" 查閱 :h vundle 獲取更多細節和wiki以及FAQ
" 將你自己對非插件片段放在這行之後
