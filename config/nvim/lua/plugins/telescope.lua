require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")

require('telescope').setup{
    defaults = {
        layout_config = {
            vertical = { width = 0.5 }
        },
    },
    pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    },
    extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
        project = {
            base_dirs = {
                "~/workspace",
            },
            hidden_files = true,
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true
        }
    }
}
