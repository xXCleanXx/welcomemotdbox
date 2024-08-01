-- utility sprites don't work right now so use hidden signals
data:extend({
  {
    type = "virtual-signal",
    name = "logo",
    icon = "__welcomemotdbox__/graphics/icons/pr0gramm.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "i[welcomemotdbox]",
  },
  {
    type = "item-subgroup",
    name = "virtual-signal-utility",
    group = "signals",
    order = "u-a"
  },
})
