local mod_gui = require("__core__/lualib/mod-gui")

---Creates overhead button
---@param player LuaPlayer Player
function WelcomeMOTDBox.UpdateOverheadButton(player)
    local button_flow = mod_gui.get_button_flow(player)
    if not button_flow then return end
  
    local button = button_flow[WelcomeMOTDBox.name_overhead_button]
  
    if not button then
    button_flow.add{
        type = "sprite-button",
        name = WelcomeMOTDBox.name_overhead_button,
        sprite = "virtual-signal/logo"
    }
    end
end