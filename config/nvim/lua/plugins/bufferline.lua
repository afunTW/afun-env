local bufferline = require('bufferline')
bufferline.setup {
    options = {
        mode = "buffer",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
                separator = true
            }
        },
    }
}
