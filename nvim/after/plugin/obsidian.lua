-- obsidian and rendering
require("markdown-plus").setup()

require("obsidian").setup({
    ui = { enable = false },
    disable_frontmatter = false,

    -- setting up my vault
    workspaces = {
        {
            name = "vault",
            path = "~/documents/vault",
        },
    },

    -- enabling completion
    completion = {
        nvim_cmp = true,
    },

    -- setting Templates folder
    templates = {
        folder = "04_Templates",
        substitutions = {
            created_at = function()
                return os.date("%H:%M %d-%m-%Y")
            end,
        },
    },

    -- disabling tags from frontmatter
    note_frontmatter_func = function(note)
        local fm = {}
        if note.metadata and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
                fm[k] = v
            end
        end
        if note.tags and #note.tags > 0 then
            fm["tags"] = note.tags
        end
        return fm
    end,

    -- generate id of file using underscore
    note_id_func = function(title)
        title = title:gsub("%s+", "_"):gsub("([%z\1-\127\194-\244][\128-\191]*)", function(c)
            if c:match("[%w_%-%.]")
                or c:match("[А-Яа-яЁё]") then -- cyrillic letters
                return c
            end

            return "_"
        end)

        return title:gsub("_+", "_"):gsub("^_+", ""):gsub("_+$", "")
    end

})

vim.api.nvim_set_keymap('n', '<leader>nn', ':ObsidianNewFromTemplate ', { noremap = true })
