remote.add_interface("welcomemotdbox",
    {
        informatron_menu = function(data)
            return Informatron.menu(data.player_index)
          end,

          informatron_page_content = function(data)
            return Informatron.page_content(data.page_name, data.player_index, data.element)
          end
    }
)