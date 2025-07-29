require("full-border"):setup()

require("restore"):setup({
    position = { "center", w = 70, h = 40 },
    show_confirm = true,
    theme = {
      title = "blue",
      header = "green",
      header_warning = "yellow",
      list_item = { odd = "blue", even = "blue" },
    },
})

require("relative-motions"):setup({ show_numbers="relative", show_motion = true, enter_mode ="first" })

require("zoxide"):setup {
	update_db = true,
}
