local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Группа для наших автокоманд
local general = augroup("General", { clear = true })

-- Подсветка при копировании
autocmd("TextYankPost", {
	group = general,
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
	desc = "Highlight on yank",
})

-- Убираем автокомментарий на новой строке
autocmd("BufEnter", {
	group = general,
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable auto comment",
})

-- Возврат на последнюю позицию в файле
autocmd("BufReadPost", {
	group = general,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lines = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lines then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	desc = "Restore cursor position",
})

-- Автоматический resize при изменении размера терминала
autocmd("VimResized", {
	group = general,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
	desc = "Auto resize splits",
})

-- Настройки для Python
autocmd("FileType", {
	group = general,
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
	desc = "Python settings",
})

-- Настройки для TypeScript/JavaScript
autocmd("FileType", {
	group = general,
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
	desc = "TypeScript/JavaScript settings",
})

-- Закрытие некоторых буферов по q
autocmd("FileType", {
	group = general,
	pattern = { "help", "qf", "man", "checkhealth" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
	desc = "Close with q",
})

-- Показывать диагностику при наведении курсора
autocmd("CursorHold", {
	group = general,
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
	desc = "Show diagnostics on hover",
})

-- Автосохранение при переходе на другой буфер/окно
autocmd({ "BufLeave", "FocusLost" }, {
	group = general,
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" then
			vim.cmd("silent! write")
		end
	end,
	desc = "Auto save on buffer leave",
})
