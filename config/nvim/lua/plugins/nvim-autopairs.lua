local npairs = require("nvim-autopairs")

-- with treesitter
npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
    },
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        manual_position = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
