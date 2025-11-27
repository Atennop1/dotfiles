-- folder to store sessions
local session_dir = vim.fn.expand("~/.cache/nvim-sessions")
if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, "p")
end

-- get first argument
local file_arg = vim.fn.argv(0)
local base_dir
local target_file = nil

if file_arg ~= "" and file_arg ~= vim.NIL then
    local resolved = vim.fn.resolve(file_arg)
    if vim.fn.isdirectory(resolved) == 0 and vim.fn.filereadable(resolved) == 1 then
        -- argument is a real file
        target_file = resolved
        base_dir = vim.fn.fnamemodify(resolved, ":p:h")
    else
        -- argument is a directory or non-existent, use it as base_dir
        base_dir = vim.fn.fnamemodify(resolved, ":p")
    end
else
    -- no argument, fallback to cwd
    base_dir = vim.fn.getcwd()
end

-- construct session path
local session_file = string.format("%s/%s.vim", session_dir,
    base_dir:gsub("[/\\]", "_"):gsub("^_", ""):gsub("_$", ""))

-- check if session exists before attempting to load
local session_exists = vim.fn.filereadable(session_file) == 1

if session_exists then
    -- only restore session if no specific file was requested OR file is already in session
    if not target_file then
        vim.cmd("silent source " .. vim.fn.fnameescape(session_file))
    else
        vim.cmd("silent source " .. vim.fn.fnameescape(session_file))

        -- check if target file is already open in one of the windows
        local file_is_open = false
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if buf_name == target_file then
                file_is_open = true
                break
            end
        end

        -- only switch to target file if it's not already open in any window
        if not file_is_open then
            vim.cmd("edit " .. vim.fn.fnameescape(target_file))
        end
    end
else
    -- no session exists, just open the target file if provided
    if target_file then
        vim.cmd("edit " .. vim.fn.fnameescape(target_file))
    end
end

-- auto-save with Obsession
if vim.fn.exists(":Obsession") == 2 then
    vim.cmd("Obsession " .. vim.fn.fnameescape(session_file))
end
