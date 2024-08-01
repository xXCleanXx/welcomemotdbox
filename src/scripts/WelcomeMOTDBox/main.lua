require("constants")
require("events")
require("ui/window")
require("ui/overheadgui")

---Gets the WelcomeMOTDBox GUI of a given player, if open.
---@param player LuaPlayer
---@return LuaGuiElement? root
function WelcomeMOTDBox.Get(player)
  return player.gui.screen[WelcomeMOTDBox.name_root]
end

---Opens the GUI for a given player.
---@param player LuaPlayer Player to open GUI for
function WelcomeMOTDBox.Open(player)
  if WelcomeMOTDBox.Get(player) then WelcomeMOTDBox.Close(player) end

  local root = WelcomeMOTDBox.Create(player)
  if root == nil then
    return
  end

  root.force_auto_center()
end

---Closes the WelcomeMOTDBox GUI for the given player
function WelcomeMOTDBox.Close(player)
  local root = WelcomeMOTDBox.Get(player)
  if root then root.destroy() end
end

---Opens/closes WelcomeMOTDBox depending on its existing state.
---@param player LuaPlayer Player
function WelcomeMOTDBox.Toggle(player)
  local root = WelcomeMOTDBox.Get(player)

  if root then
    WelcomeMOTDBox.Close(player)
  else
    WelcomeMOTDBox.Open(player)
  end
end