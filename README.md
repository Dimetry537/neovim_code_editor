# Neovim Configuration

Персональная конфигурация Neovim для разработки на Python и TypeScript.

## Требования

- Neovim >= 0.10
- Git
- [Nerd Font](https://www.nerdfonts.com/) (рекомендуется JetBrains Mono Nerd)
- ripgrep, fd (для telescope)
- npm (для LSP серверов)

## Установка

### Быстрая установка

```bash
git clone https://github.com/Dimetry537/neovim_code_editor.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
nvim
```

### Ручная установка

#### Arch Linux

```bash
sudo pacman -S neovim git ripgrep fd npm python-pynvim xclip ttf-jetbrains-mono-nerd
git clone https://github.com/Dimetry537/neovim_code_editor.git ~/.config/nvim
nvim
```

#### Ubuntu / WSL2

```bash
sudo apt update
sudo apt install git ripgrep fd-find npm python3-pynvim xclip
sudo ln -s $(which fdfind) /usr/local/bin/fd

# Свежий Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

git clone https://github.com/Dimetry537/neovim_code_editor.git ~/.config/nvim
nvim
```

> **WSL2:** Установи [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip) на Windows и выбери его в настройках Windows Terminal.

При первом запуске lazy.nvim автоматически установит все плагины.

## Структура

```
~/.config/nvim/
├── init.lua                 # Точка входа
├── install.sh               # Скрипт установки
├── lua/
│   ├── core/
│   │   ├── options.lua      # Базовые настройки
│   │   ├── keymaps.lua      # Клавиатурные сочетания
│   │   └── autocmds.lua     # Автокоманды
│   └── plugins/
│       ├── init.lua         # Пустой (для lazy.nvim)
│       ├── ui.lua           # Тема, statusline, which-key
│       ├── neo-tree.lua     # Файловый менеджер
│       ├── telescope.lua    # Поиск
│       ├── treesitter.lua   # Подсветка синтаксиса
│       ├── lsp.lua          # LSP + Mason
│       ├── cmp.lua          # Автодополнение
│       ├── formatting.lua   # Форматирование и линтинг
│       ├── extras.lua       # Дополнительные плагины
│       ├── claude.lua       # Claude Code интеграция
│       └── codeium.lua      # AI автодополнение
└── README.md
```

## Клавиши

Leader: `Space`

### Общие

| Клавиши     | Описание                  |
| ----------- | ------------------------- |
| `jk`        | Выход из insert mode      |
| `<leader>w` | Сохранить файл            |
| `<leader>q` | Выйти                     |
| `<Esc>`     | Очистить подсветку поиска |
| `<C-c>`     | Копировать (visual mode)  |
| `<C-v>`     | Вставить                  |
| `<C-a>`     | Выделить всё              |

### Навигация

| Клавиши           | Описание                     |
| ----------------- | ---------------------------- |
| `<C-h/j/k/l>`     | Переход между окнами         |
| `<S-h>` / `<S-l>` | Предыдущий / следующий буфер |
| `<leader>bd`      | Закрыть буфер                |
| `gd`              | Перейти к определению        |
| `gr`              | Найти ссылки                 |
| `gi`              | Перейти к реализации         |

### Файлы и поиск

| Клавиши      | Описание                 |
| ------------ | ------------------------ |
| `<leader>e`  | Открыть/закрыть neo-tree |
| `<leader>o`  | Фокус на neo-tree        |
| `<leader>ff` | Поиск файлов             |
| `<leader>fg` | Поиск текста (live grep) |
| `<leader>fb` | Список буферов           |
| `<leader>fr` | Недавние файлы           |
| `<leader>/`  | Поиск в текущем буфере   |

### Neo-tree

| Клавиши | Описание                            |
| ------- | ----------------------------------- |
| `a`     | Создать файл (добавь `/` для папки) |
| `d`     | Удалить                             |
| `r`     | Переименовать                       |
| `c`     | Копировать                          |
| `m`     | Переместить                         |
| `p`     | Вставить                            |
| `s`     | Открыть вертикально                 |
| `S`     | Открыть горизонтально               |

### LSP

| Клавиши      | Описание                      |
| ------------ | ----------------------------- |
| `K`          | Документация                  |
| `<leader>ca` | Code action                   |
| `<leader>rn` | Переименовать                 |
| `<leader>d`  | Показать диагностику          |
| `<leader>dc` | Копировать диагностику        |
| `<leader>dq` | Диагностика в quickfix        |
| `[d` / `]d`  | Предыдущая / следующая ошибка |

### Форматирование

| Клавиши      | Описание                    |
| ------------ | --------------------------- |
| `<leader>cf` | Форматировать файл          |
| `>` / `<`    | Сдвиг отступа (visual mode) |

### Git

| Клавиши      | Описание                    |
| ------------ | --------------------------- |
| `]h` / `[h`  | Следующий / предыдущий hunk |
| `<leader>hs` | Stage hunk                  |
| `<leader>hr` | Reset hunk                  |
| `<leader>hp` | Preview hunk                |
| `<leader>hb` | Git blame                   |

### Комментарии

| Клавиши | Описание                       |
| ------- | ------------------------------ |
| `gcc`   | Закомментировать строку        |
| `gc`    | Закомментировать (visual mode) |

### AI

| Клавиши      | Описание            |
| ------------ | ------------------- |
| `<leader>cc` | Открыть Claude Code |
| `<leader>cq` | Закрыть Claude Code |

## LSP серверы

Устанавливаются автоматически через Mason:

- **Python**: pyright
- **TypeScript/JavaScript**: ts_ls

## Форматтеры и линтеры

Устанавливаются автоматически через Mason:

- **Python**: black, isort, ruff
- **TypeScript/JavaScript**: prettier, eslint_d

## Плагины

| Плагин           | Описание                   |
| ---------------- | -------------------------- |
| lazy.nvim        | Менеджер плагинов          |
| catppuccin       | Цветовая тема              |
| lualine          | Statusline                 |
| neo-tree         | Файловый менеджер          |
| telescope        | Поиск                      |
| nvim-treesitter  | Подсветка синтаксиса       |
| nvim-lspconfig   | LSP                        |
| mason.nvim       | Установщик LSP/форматтеров |
| nvim-cmp         | Автодополнение             |
| conform.nvim     | Форматирование             |
| nvim-lint        | Линтинг                    |
| gitsigns         | Git интеграция             |
| Comment.nvim     | Комментирование            |
| nvim-autopairs   | Автозакрытие скобок        |
| which-key        | Подсказки клавиш           |
| claude-code.nvim | Claude AI интеграция       |
| codeium.nvim     | AI автодополнение          |
