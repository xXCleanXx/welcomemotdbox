---@diagnostic disable-next-line
welcomemotdbox_menu_width = 250
---@diagnostic disable-next-line
welcomemotdbox_content_width = 940 -- inner width is welcomemotdbox_content_width - 40 - 12

local style = data.raw["gui-style"]["default"]

style.welcomemotdbox_root_frame = {
    type = "frame_style"
  }
  
  style.welcomemotdbox_titlebar_flow = {
    type = "horizontal_flow_style",
    horizontal_spacing = 8
  }
  
  style.welcomemotdbox_titlebar_icon = {
    type = "image_style",
    size = 20,
    stretch_image_to_widget_size = true
  }
  
  style.welcomemotdbox_drag_handle = {
    type = "empty_widget_style",
    parent = "draggable_space",
    horizontally_stretchable = "on",
    height = 24,
    left_margin = 4,
    right_margin = 4
  }
    
  style.welcomemotdbox_main_flow = {
    type = "horizontal_flow_style",
    horizontal_spacing = 8
  }
  
  style.welcomemotdbox_menu_frame = {
    type = "frame_style",
    parent = "inside_deep_frame",
    width = welcomemotdbox_menu_width,
    vertically_stretchable = "stretch_and_expand"
  }
  
  style.welcomemotdbox_menu_scroll_pane = {
    type = "scroll_pane_style",
    parent = "list_box_scroll_pane",
    horizontally_stretchable = "stretch_and_expand",
    vertically_stretchable = "stretch_and_expand",
    dont_force_clipping_rect_for_contents = true,
    padding = 0,
    vertical_flow_style = {
      type = "vertical_flow_style",
      vertical_spacing = 4,
    },
  }
  
  style.welcomemotdbox_menu_button = {
    type = "button_style",
    font = "default-listbox",
    horizontal_align = "left",
    horizontally_stretchable = "on",
    horizontally_squashable = "on",
    bottom_margin = -3,
    default_font_color = {227, 227, 227},
    hovered_font_color = {0, 0, 0},
    selected_clicked_font_color = {0.97, 0.54, 0.15},
    selected_font_color = {0.97, 0.54, 0.15 },
    selected_hovered_font_color = {0.97, 0.54, 0.15},
    default_graphical_set = {
      corner_size = 8,
      position = {208, 17}
    },
    clicked_graphical_set = {
      corner_size = 8,
      position = {352, 17}
    },
    hovered_graphical_set = {
      base = {
        corner_size = 8,
        position = {34, 17}
      }
    },
    disabled_graphical_set = {
      corner_size = 8,
      position = {17, 17}
    }
  }
  
  style.welcomemotdbox_menu_button_primary = {
    type = "button_style",
    parent = "welcomemotdbox_menu_button",
    font = "default-bold",
    default_font_color = {255, 230,192},
  }
  
  style.welcomemotdbox_menu_button_selected = {
    type = "button_style",
    parent = "welcomemotdbox_menu_button",
    default_font_color = {0, 0, 0},
    hovered_font_color = {0, 0, 0},
    selected_clicked_font_color = {0, 0, 0},
    selected_font_color = {0, 0, 0},
    selected_hovered_font_color = {0, 0, 0},
    default_graphical_set = {
      corner_size = 8,
      position = { 54, 17 }
    },
    hovered_graphical_set = {
      corner_size = 8,
      position = { 54, 17 }
    }
  }
  
  style.welcomemotdbox_menu_button_primary_selected = {
    type = "button_style",
    parent = "welcomemotdbox_menu_button_selected",
    font = "default-bold",
  }
  
  style.welcomemotdbox_content_frame = {
    type = "frame_style",
    parent = "inside_shallow_frame",
    width = welcomemotdbox_content_width,
    horizontally_stretchable = "on",
    vertically_stretchable = "on"
  }
  
  style.welcomemotdbox_content_subheader_frame = {
    type = "frame_style",
    parent = "subheader_frame",
    height = 56,
    horizontally_stretchable = "stretch_and_expand",
    vertical_flow_style = {
      left_padding = 20,
      right_padding = 20,
      top_padding = 5,
      type = "vertical_flow_style",
      vertical_align = "center"
    }
  }
  
  style.welcomemotdbox_content_title = {
    type = "label_style",
    parent = "frame_title",
    font = "heading-2"
  }
  
  style.welcomemotdbox_content_scroll_pane = {
    type = "scroll_pane_style",
    parent = "naked_scroll_pane",
    width = welcomemotdbox_content_width,
    padding = 20,
    extra_padding_when_activated = 0,
    vertically_stretchable = "on"
  }