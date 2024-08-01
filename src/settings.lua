data:extend{
    {
        type = "int-setting",
        name = "welcomemotdbox-window-height",
        setting_type = "runtime-global",
        minimum_value = 240,
        default_value = 480
    },
    {
        type = "int-setting",
        name = "welcomemotdbox-window-width",
        setting_type = "runtime-global",
        minimum_value = 240,
        default_value = 940
    },
    {
        type = "bool-setting",
        name = "welcomemotdbox-show-big-logo",
        setting_type = "runtime-global",
        default_value = false
    },
    {
        type = "string-setting",
        name = "welcomemotdbox-motd-heading-1",
        setting_type = "runtime-global",
        default_value = "Heading 1",
        allow_blank = true
    },
    {
        type = "string-setting",
        name = "welcomemotdbox-motd-heading-2",
        setting_type = "runtime-global",
        default_value = "Heading 2",
        allow_blank = true
    },
    {
        type = "bool-setting",
        name = "welcomemotdbox-show-greeting-string",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "welcomemotdbox-force-user-motd",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "string-setting",
        name = "welcomemotdbox-motd-content",
        setting_type = "runtime-global",
        default_value = "Place your MOTD here...",
    },
    {
        type = "bool-setting",
        name = "welcomemotdbox-show-motd",
        setting_type = "runtime-per-user",
        default_value = true
    }
  }