---@param parent LuaGuiElement
local function RenderTitlebar(parent)
  local titlebar = parent.add{
    type = "flow",
    name = WelcomeMOTDBox.name_title_flow,
    direction = "horizontal",
    style = "welcomemotdbox_titlebar_flow"
  }
  titlebar.drag_target = parent
  titlebar.add{ -- Sprite
    type = "sprite",
    sprite = "virtual-signal/logo",
    ignored_by_interaction = true,
    style = "welcomemotdbox_titlebar_icon"
  }
  titlebar.add{ -- Title
    type = "label",
    caption = {"motd.titlebar"},
    ignored_by_interaction = true,
    style = "frame_title"
  }
  titlebar.add{
    type = "empty-widget",
    ignored_by_interaction = true,
    style = "welcomemotdbox_drag_handle"
  }
  titlebar.add{ -- Close button
    type = "sprite-button",
    sprite = "utility/close",
    hovered_sprite = "utility/close_black",
    clicked_sprite = "utility/close_black",
    tags = {root=WelcomeMOTDBox.name_root, action=WelcomeMOTDBox.action_close_button},
    style = "close_button"
  }
end

---@param parent LuaGuiElement
local function RenderSubheader(parent)
  if settings.global["welcomemotdbox-motd-heading-1"].value ~= "" or settings.global["welcomemotdbox-motd-heading-2"].value ~= "" then
    local subheader = parent.add{
      type = "frame",
      name = WelcomeMOTDBox.name_content_subheader,
      direction = "vertical",
      style = "welcomemotdbox_content_subheader_frame"
    }

    subheader.add{
      type = "label",
      name = WelcomeMOTDBox.name_content_path,
      caption = settings.global["welcomemotdbox-motd-heading-1"].value
    }
    subheader.add{
      type = "label",
      name = WelcomeMOTDBox.name_content_title,
      style = "welcomemotdbox_content_title",
      caption = settings.global["welcomemotdbox-motd-heading-2"].value
    }
  end
end

---@param parent LuaGuiElement
local function RenderLogo(parent)
  if settings.global["welcomemotdbox-show-big-logo"].value then
    local image_container = parent.add{type = "flow"}
      image_container.style.horizontally_stretchable = true
      image_container.style.horizontal_align = "center"
      image_container.add{type="sprite", sprite="logobig"}
  end
end

---@param parent LuaGuiElement
---@param player LuaPlayer
local function RenderGreetingString(parent, player)
  if settings.global["welcomemotdbox-show-greeting-string"].value then
    parent.add{
      type = "label",
      style = "frame_title",
      caption = {"motd.title", player.name}
    }
  end
end

---@param parent LuaGuiElement
local function RenderContent(parent)
  local str_content = settings.global["welcomemotdbox-motd-content"].value --[[@as string]]
  str_content = str_content:gsub("\\n","\n"):gsub("\\t", "   ")

  parent.add{
    type = "label",
    caption = str_content
  }.style.single_line = false
end

---@param player LuaPlayer Player to open GUI for
---@return LuaGuiElement? root
function WelcomeMOTDBox.Create(player)
    local root = player.gui.screen.add{
        type = "frame",
        direction = "vertical",
        name = WelcomeMOTDBox.name_root,
        style = "welcomemotdbox_root_frame"
      }

      root.style.height = settings.global["welcomemotdbox-window-height"].value --[[@as int]]
      root.style.width = settings.global["welcomemotdbox-window-width"].value --[[@as int]] + 24
  
      -- Check in case another mod destroyed the GUI upon setting `player.opened`
      player.opened = root
      if not root.valid then return nil end
  
      RenderTitlebar(root)
  
      local main_flow = root.add{
        type = "flow",
        name = WelcomeMOTDBox.name_main_flow,
        direction = "horizontal",
        style = "welcomemotdbox_main_flow"
      }
  
      local content_container = main_flow.add{
        type = "frame",
        name = WelcomeMOTDBox.name_content_container,
        direction = "vertical",
        style = "welcomemotdbox_content_frame"
      }
      content_container.style.width = settings.global["welcomemotdbox-window-width"].value --[[@as int]]
  
      RenderSubheader(content_container)
  
      local motd_content_label = content_container.add{
        type = "scroll-pane",
        name = WelcomeMOTDBox.name_content_pane,
        style = "welcomemotdbox_content_scroll_pane",
      }
      motd_content_label.style.width = settings.global["welcomemotdbox-window-width"].value --[[@as int]]

      RenderLogo(motd_content_label)
      RenderGreetingString(motd_content_label, player)
      RenderContent(motd_content_label)

      return root
end