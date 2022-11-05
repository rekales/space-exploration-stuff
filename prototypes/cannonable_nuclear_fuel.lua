if settings.startup["cannonable-nuclear-fuel"].value 
then 
  local data_util = require("data_util")

  -- yeah that's right, I stole this code because I don't know the interface for adding a cannonable item

    local fuel_item = data.raw["item"]["uranium-fuel-cell"]
    local used_fuel_item = data.raw["item"]["used-up-uranium-fuel-cell"]

  data:extend({
    {
        type = "item",
        name = "se-delivery-cannon-package-"..fuel_item.name,
        icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
        icon_size = 64,
        order = (fuel_item.order or fuel_item.name) .. "-|-" .. (fuel_item.order or fuel_item.name),
        flags = {"hidden"},
        subgroup = fuel_item.subgroup or "delivery-cannon-capsules",
        stack_size = 1,
        localised_name = {"item-name.se-delivery-cannon-capsule-packed", fuel_item.localised_name or {"item-name."..fuel_item.name}}
    },
    {
        type = "recipe",
        name = "se-delivery-cannon-pack-" .. fuel_item.name,
        icon = fuel_item.icon,
        icon_size = fuel_item.icon_size,
        icon_mipmaps = fuel_item.icon_mipmaps,
        icons = fuel_item.icons,
        result = "se-delivery-cannon-package-"..fuel_item.name,
        enabled = true,
        energy_required = 5,
        ingredients = {
          { "se-delivery-cannon-capsule", 1 },
          { type = (type == 'fluid') and 'fluid' or 'item', name = fuel_item.name, amount = fuel_item.stack_size},
        },
        requester_paste_multiplier = 1,
        always_show_made_in = false,
        category = "delivery-cannon",
        hide_from_player_crafting = true,
        hide_from_stats = true,
        localised_name = {"item-name.se-delivery-cannon-capsule-packed", fuel_item.localised_name or {"item-name."..fuel_item.name}},
        allow_decomposition = false
    },
  })

  data:extend({
    {
        type = "item",
        name = "se-delivery-cannon-package-"..used_fuel_item.name,
        icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
        icon_size = 64,
        order = (used_fuel_item.order or used_fuel_item.name) .. "-|-" .. (used_fuel_item.order or used_fuel_item.name),
        flags = {"hidden"},
        subgroup = used_fuel_item.subgroup or "delivery-cannon-capsules",
        stack_size = 1,
        localised_name = {"item-name.se-delivery-cannon-capsule-packed", used_fuel_item.localised_name or {"item-name."..used_fuel_item.name}}
    },
    {
        type = "recipe",
        name = "se-delivery-cannon-pack-" .. used_fuel_item.name,
        icon = used_fuel_item.icon,
        icon_size = used_fuel_item.icon_size,
        icon_mipmaps = used_fuel_item.icon_mipmaps,
        icons = used_fuel_item.icons,
        result = "se-delivery-cannon-package-"..used_fuel_item.name,
        enabled = true,
        energy_required = 5,
        ingredients = {
          { "se-delivery-cannon-capsule", 1 },
          { type = (type == 'fluid') and 'fluid' or 'item', name = used_fuel_item.name, amount = used_fuel_item.stack_size},
        },
        requester_paste_multiplier = 1,
        always_show_made_in = false,
        category = "delivery-cannon",
        hide_from_player_crafting = true,
        hide_from_stats = true,
        localised_name = {"item-name.se-delivery-cannon-capsule-packed", used_fuel_item.localised_name or {"item-name."..used_fuel_item.name}},
        allow_decomposition = false
    },
  })
end
