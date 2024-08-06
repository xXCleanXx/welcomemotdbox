---Initializes
function WelcomeMOTDBox.on_init()
    -- In case mod is being added mid-game
    for _, player in pairs(game.players) do
        WelcomeMOTDBox.UpdateOverheadButton(player)
    end
end
script.on_init(WelcomeMOTDBox.on_init)

---Handles new player creation.
---@param event EventData.on_player_created Event data
function WelcomeMOTDBox.on_player_created(event)
    WelcomeMOTDBox.UpdateOverheadButton(game.get_player(event.player_index) --[[@as LuaPlayer]])
    print("Weclome MOTD Box initialized - operating within normal parameteres...")
end
script.on_event(defines.events.on_player_created, WelcomeMOTDBox.on_player_created)

---Handles mod changes.
function WelcomeMOTDBox.on_configuration_changed()
    for _, player in pairs(game.players) do
        -- If a player had WelcomeMOTDBox open, close/reopen it to refresh its contents
        local root = WelcomeMOTDBox.Get(player)
        if root then
            WelcomeMOTDBox.Close(player)
            WelcomeMOTDBox.Open(player)
        end
    end
end
script.on_configuration_changed(WelcomeMOTDBox.on_configuration_changed)

---@param event EventData.on_player_joined_game Event data
function WelcomeMOTDBox.on_player_joined(event)
    local player = game.get_player(event.player_index)
    local root = WelcomeMOTDBox.Get(player --[[@as LuaPlayer]])

    if settings.global["welcomemotdbox-force-user-motd"].value or settings.get_player_settings(event.player_index)["welcomemotdbox-show-motd"].value then
        if root then
            WelcomeMOTDBox.Close(player)
        else
            WelcomeMOTDBox.Open(player --[[@as LuaPlayer]])
        end
    end
end
script.on_event(defines.events.on_player_joined_game, WelcomeMOTDBox.on_player_joined)

---Handles the keyboard shortcut
---@param event EventData.CustomInputEvent Event data
function WelcomeMOTDBox.on_keyboard_shortcut(event)
  WelcomeMOTDBox.Toggle(game.get_player(event.player_index) --[[@as LuaPlayer]])
end
script.on_event(WelcomeMOTDBox.name_event, WelcomeMOTDBox.on_keyboard_shortcut)

---Handles gui clicks, including for the overhead button.
---@param event EventData.on_gui_click Event data
function WelcomeMOTDBox.on_gui_click(event)
    if event.element.name == WelcomeMOTDBox.name_overhead_button then
        WelcomeMOTDBox.Toggle(game.get_player(event.player_index) --[[@as LuaPlayer]])
      return
    end
    if event.element.tags.root ~= "welcomemotdbox" then return end

    local tags = event.element.tags
    local action = tags.action
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]

    if action == WelcomeMOTDBox.action_close_button then
        WelcomeMOTDBox.Close(player)
    end
end
script.on_event(defines.events.on_gui_click, WelcomeMOTDBox.on_gui_click)