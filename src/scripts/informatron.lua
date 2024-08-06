local Informatron = {} -- informatron pages implementation.

function Informatron.menu(player_index)
  local menu = {

  }
  return menu
end

function Informatron.page_content(page_name, player_index, element)
  if page_name == "welcomemotdbox" then
    element.add{type="label", name="motd-text", caption={"welcomemotdbox.page_datapad_text_1"}}
  end
end

return Informatron