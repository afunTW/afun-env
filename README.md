# afun-env

紀錄目前的環境配置，包含工作流程使用到的工具以及一些自動化的 script

- [afun-env](#afun-env)
  - [程式開發](#%E7%A8%8B%E5%BC%8F%E9%96%8B%E7%99%BC)
    - [編輯器](#%E7%B7%A8%E8%BC%AF%E5%99%A8)
    - [CLI 工具](#CLI-%E5%B7%A5%E5%85%B7)
    - [系統工具](#%E7%B3%BB%E7%B5%B1%E5%B7%A5%E5%85%B7)
  - [簡報文件](#%E7%B0%A1%E5%A0%B1%E6%96%87%E4%BB%B6)
  - [社交通訊](#%E7%A4%BE%E4%BA%A4%E9%80%9A%E8%A8%8A)
  - [其他工具](#%E5%85%B6%E4%BB%96%E5%B7%A5%E5%85%B7)
  - [OS - Ubuntu](#OS---Ubuntu)

## 程式開發

### 編輯器

| 名稱 | 用途 | 使用頻率 | Note |
| ----- | ----- | ----- | ----- |
| [vscode](https://code.visualstudio.com/) | 程式 / 文件 | 普通 | 需補充 plugin 清單 |
| [vim](https://www.vim.org/) | 程式 / 文件 | 經常 | 需補充 plugin 清單與 vimrc |

- vscode 主要在多專案的情境中使用, markdown preview 與視窗切換方便, 可以 sftp 掛 server 專案工作
- vim 熟悉門檻高, 彈性大也適合在 server 中直接撰寫, 目前主要會透過 vim 來更改

```sh
wget -c https://raw.githubusercontent.com/afunTW/afun-env/master/tools/vim/vimrc.min -O ~/.vimrc
```

### CLI 工具

| 名稱 | 用途 | 使用頻率 | Note |
| ----- | ----- | ----- | ----- |
| [jq](https://github.com/stedolan/jq) | parse JSON | 普通 | 學習中 |
| [ranger](https://github.com/ranger/ranger) | file manager | 經常 | 學習中 |

### 系統工具

| 名稱 | 用途 | 使用頻率 | Note |
| ----- | ----- | ----- | ----- |
| [iptables](https://www.netfilter.org/projects/iptables/index.html) | packet filtering ruleset | 普通 | 忘記在哪裡找到的 script 方便快速設定 rules |


## 簡報文件

| 名稱 | 用途 | 使用頻率 | Note |
| ----- | ----- | ----- | ----- |
| [google slide](https://www.google.com/intl/zh-TW_tw/slides/about/) | 投影片 | 經常 | 主要簡報方式，比起其他依賴 OS 的簡報更適用 |
| [hackmd](https://hackmd.io/) | 投影片/ 檔案紀錄/ 共筆 | 普通 | 特殊目的，主要基於共享目的撰寫 |
| [Typora](https://typora.io/) | 跨平台 Markdown 編輯器 | 普通 | 日常筆記 |

## 社交通訊

| 名稱 | 用途 | 使用頻率 | Note |
| ----- | ----- | ----- | ----- |
| [Telegram](https://telegram.org/) | 社群討論 / 頻道通知 | 常駐 | 主要討論技術 |


## 其他工具

| 名稱 | 用途 | 使用頻率 | Note |
| ----- | ----- | ----- | ----- |
| [Dashlane](https://www.dashlane.com/) | Password manager | 常駐 | 還在熟悉中 |
| [Notion](https://www.notion.so/) | all-in-one workspace | 常駐 | 還在熟悉並設計中，取代 Evernote 當作日常管理的工作區域 |
| [mathpix](https://mathpix.com/) | Convert images to LaTeX | 普通 | CTRL+ALT+M 以截圖方式判讀變轉成 LateX 語法 |
| [Math Equation](https://chrome.google.com/webstore/detail/math-equations/edbiogkpgmbdkmgmdcdmgminoahbcdml) | Convert LaTex to images | 普通　| google slides plugin, 搭配 mathpix 可以很方便的在投影片上做數學式 |

## OS - Ubuntu

> It's not availabe to use vimplugin in ubuntu16

Refer to [afunTW/better-working-with](https://github.com/afunTW/better-working-with), write up a script to install tools.

```sh
git clone https://github.com/afunTW/afun-env
./config.sh
```
