local treesitter  = require("nvim-treesitter")

local base_parsers = {
    -- langauges
    "bash", "python", "html", "javascript",
    "css", "yaml", "xml", "json", "toml",
    -- extras
    "http", "dockerfile", "markdown", "markdown_inline",
    "gitcommit", "gitignore", "diff", "git_rebase", "comment",
    "regex",
}
treesitter.install(base_parsers)

package.loaded["parsers"] = nil
local ok, optional_parsers = pcall(require, "parsers")
if ok then
    treesitter.install(optional_parsers)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype

        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
            return
        end

        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
            return
        end

        pcall(vim.treesitter.start, buf, lang)
    end,
})
