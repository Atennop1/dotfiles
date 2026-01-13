-- this is file for automatic saving and loading my sessions using vim-obsession
-- i keep it separate because it isn't really a part of my config, but just a support tool
local session_dir = vim.fn.expand("~/.cache/nvim-sessions")
if vim.fn.isdirectory(session_dir) == 0 then
	vim.fn.mkdir(session_dir, "p")
end

local file_arg = vim.fn.argv(0)
local base_dir = vim.fn.getcwd()
local target_file = nil

if file_arg ~= "" and file_arg ~= vim.NIL then
	local resolved = vim.fn.resolve(file_arg)
	if vim.fn.isdirectory(resolved) == 0 and vim.fn.filereadable(resolved) == 1 then
		target_file = resolved
		base_dir = vim.fn.fnamemodify(resolved, ":p:h")
	else
		base_dir = vim.fn.fnamemodify(resolved, ":p")
	end
end

local session_file = string.format("%s/%s.vim", session_dir, base_dir:gsub("[/\\]", "_"):gsub("^_", ""):gsub("_$", ""))
if vim.fn.filereadable(session_file) == 1 then
	vim.cmd("silent source " .. vim.fn.fnameescape(session_file))
elseif target_file then
	vim.cmd("edit " .. vim.fn.fnameescape(target_file))
end

if vim.fn.exists(":Obsession") == 2 then
	vim.cmd("Obsession " .. vim.fn.fnameescape(session_file))
end
