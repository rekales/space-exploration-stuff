local data_util = require("data_util")

local neutral_core_landfill = table.deepcopy(data.raw["recipe"]["landfill"])
local landfill_item = data.raw["item"]["landfill"]
local neutral_core_item = data.raw["item"]["se-core-fragment-omni"]


neutral_core_landfill.name = data_util.mod_prefix .. "landfill-neutral-core"
neutral_core_landfill.category = "hard-recycling"
neutral_core_landfill.ingredients = 
{
  {name="se-core-fragment-omni", amount=30},
}
neutral_core_landfill.results = {{name="landfill", amount=1}}
neutral_core_landfill.energy_required = 4
neutral_core_landfill.enabled = false

neutral_core_landfill.icons = 
{
  {
    icon = landfill_item.icon,
    icon_size = landfill_item.icon_size
  },
  {
    icon = neutral_core_item.icons[1].icon,
    icon_size = neutral_core_item.icons[1].icon_size,
    scale = 0.33
  }
}

table.insert(data.raw["technology"]["se-recycling-facility"].effects, {type="unlock-recipe", recipe=neutral_core_landfill.name})

data:extend(
{
  neutral_core_landfill,
})