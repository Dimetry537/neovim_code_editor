# Neovim Configuration

Персональная конфигурация Neovim для разработки на Python и TypeScript.

## Требования

- Neovim >= 0.10
- Git
- [Nerd Font](https://www.nerdfonts.com/) (рекомендуется JetBrains Mono Nerd)
- ripgrep, fd (для telescope)
- npm (для LSP серверов)

### Arch Linux

```bash
sudo pacman -S neovim git ripgrep fd npm python-pynvim xclip ttf-jetbrains-mono-nerd
```

## Установка

```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
nvim
```

При первом запуске lazy.nvim автоматически установит все плагины.

## Структура

```
~/.config/nvim/
├── init.lua                 # Точка входа
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
│       └── extras.lua       # Дополнительные плагины
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

### Навигация

| Клавиши           | Описание                     |
| ----------------- | ---------------------------- |
| `<C-h/j/k/l>`     | Переход между окнами         |
| `<S-h>` / `<S-l>` | Предыдущий / следующий буфер |
| `<leader>bd`      | Закрыть буфер                |

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

### LSP

| Клавиши      | Описание                      |
| ------------ | ----------------------------- |
| `gd`         | Перейти к определению         |
| `gr`         | Найти ссылки                  |
| `gi`         | Перейти к реализации          |
| `K`          | Документация                  |
| `<leader>ca` | Code action                   |
| `<leader>rn` | Переименовать                 |
| `<leader>d`  | Показать диагностику          |
| `[d` / `]d`  | Предыдущая / следующая ошибка |

### Форматирование

| Клавиши      | Описание           |
| ------------ | ------------------ |
| `<leader>cf` | Форматировать файл |

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

## LSP серверы

Устанавливаются автоматически через Mason:

- **Python**: pyright
- **TypeScript/JavaScript**: ts_ls

## Форматтеры и линтеры

Устанавливаются автоматически через Mason:

- **Python**: black, isort, ruff
- **TypeScript/JavaScript**: prettier, eslint_d
- **Lua**: stylua

## Плагины

- **lazy.nvim** — менеджер плагинов
- **catppuccin** — цветовая тема
- **lualine** — statusline
- **neo-tree** — файловый менеджер
- **telescope** — поиск
- **nvim-treesitter** — подсветка синтаксиса
- **nvim-lspconfig** — LSP
- **mason.nvim** — установщик LSP/форматтеров
- **nvim-cmp** — автодополнение
- **conform.nvim** — форматирование
- **nvim-lint** — линтинг
- **gitsigns** — git интеграция
- **Comment.nvim** — комментирование
- **nvim-autopairs** — автозакрытие скобок
- **which-key** — подсказки клавиш
