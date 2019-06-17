# afun-env

紀錄目前的環境配置，包含工作流程使用到的工具以及一些自動化的 script

- [afun-env](#afun-env)
  - [程式開發](#%E7%A8%8B%E5%BC%8F%E9%96%8B%E7%99%BC)
    - [編輯器](#%E7%B7%A8%E8%BC%AF%E5%99%A8)
  - [簡報文件](#%E7%B0%A1%E5%A0%B1%E6%96%87%E4%BB%B6)
  - [其他工具](#%E5%85%B6%E4%BB%96%E5%B7%A5%E5%85%B7)
  - [OS - Ubuntu](#OS---Ubuntu)

## 程式開發

### 編輯器

| 名稱 | Note |
| ----- | ----- |
| [vscode](https://code.visualstudio.com/) | 需補充 plugin 清單 |
| [vim](https://www.vim.org/) | 需補充 plugin 清單與 vimrc |

- vscode 主要在多專案的情境中使用, markdown preview 與視窗切換方便, 可以 sftp 掛 server 專案工作
- vim 熟悉門檻高, 彈性大也適合在 server 中直接撰寫, 目前主要會透過 vim 來更改

```sh
wget -c https://raw.githubusercontent.com/afunTW/afun-env/master/vim/vimrc -O ~/.vimrc
```

## 簡報文件

| 名稱 | 用途 | Note |
| ----- | ----- | ----- |
| [google slide](https://www.google.com/intl/zh-TW_tw/slides/about/) | 投影片 | 主要簡報方式，比起其他依賴 OS 的簡報更適用 |
| [hackmd](https://hackmd.io/) | 投影片/ 檔案紀錄/ 共筆 | 非日常使用, conference 共筆經常選擇的工具 |

## 其他工具

| 名稱 | 用途 | Note |
| ----- | ----- | ----- |
| [Dashlane](https://www.dashlane.com/) | Password manager | (還在熟悉中) |
| [Notion](https://www.notion.so/) | all-in-one workspace | 取代 Evernote 當作日常管理的工作區域 (還在熟悉並設計中) |
| [mathpix](https://mathpix.com/) | Convert images to LaTeX | CTRL+ALT+M 以截圖方式判讀變轉成 LateX 語法 |
| [Math Equation](https://chrome.google.com/webstore/detail/math-equations/edbiogkpgmbdkmgmdcdmgminoahbcdml) | Convert LaTex to images | google slides plugin, 搭配 mathpix 可以很方便的在投影片上做數學式 |

## OS - Ubuntu

> It's not availabe to use vimplugin in ubuntu16

Refer to [afunTW/better-working-with](https://github.com/afunTW/better-working-with), write up a script to install tools.

```sh
git clone https://github.com/afunTW/afun-env
./config.sh
```
