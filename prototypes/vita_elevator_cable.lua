if settings.startup["vita-elevator-cable"].value 
then 
  local data_util = require("data_util")

  local vita_cable_recipe = table.deepcopy(data.raw["recipe"]["se-space-elevator-cable"])
  local classic_cable_recipe = data.raw["recipe"]["se-space-elevator-cable"]
  local classic_cable_item = data.raw["item"]["se-space-elevator-cable"]
  local epoxy_item = data.raw["item"]["se-vitalic-epoxy"]

  vita_cable_recipe.name = data_util.mod_prefix .. "space-elevator-cable-vita"
  -- vita_cable_recipe.localised_name = {"recipe-name."..vita_cable_recipe.name}
  vita_cable_recipe.category = "crafting-with-fluid"
  vita_cable_recipe.ingredients = 
  {
    { type="item", name="se-holmium-cable", amount=3},
    { type="item", name=epoxy_item.name, amount=1},
    { type="item", name="se-vitalic-reagent", amount=2},
    { type="item", name="se-aeroframe-pole", amount=6},
    { type="fluid", name="se-methane-gas", amount=16},
  }

  vita_cable_recipe.results = {{type="item", name=classic_cable_item.name, amount=8}}
  vita_cable_recipe.energy_required = classic_cable_recipe.energy_required * 4
  vita_cable_recipe.enabled = false
  -- table.insert(data.raw["technology"]["se-space-catalogue-biological-1"].effects, {type="unlock-recipe", recipe=biosludge_coal.name})

  vita_cable_recipe.icons = 
  {
    {
      icon = classic_cable_item.icon, 
      icon_size = classic_cable_item.icon_size
    },
    {
      icon = epoxy_item.icon, 
      icon_size = epoxy_item.icon_size,
      scale = .25,
      shift = {-7,-7}
    }
  }

  local epoxy_tech = data.raw["technology"]["se-vitalic-epoxy"]
  local vita_cable_tech = table.deepcopy(data.raw["technology"]["se-space-elevator"])
  vita_cable_tech.name = vita_cable_recipe.name
  vita_cable_tech.effects = {{type="unlock-recipe", recipe=vita_cable_recipe.name}}
  vita_cable_tech.prerequisites = {epoxy_tech.name}
  vita_cable_tech.unit.count = epoxy_tech.unit.count * 2
  vita_cable_tech.unit.time = epoxy_tech.unit.time
  vita_cable_tech.unit.ingredients = data.raw["technology"]["se-space-elevator"].unit.ingredients
  table.insert(vita_cable_tech.unit.ingredients, {name="se-biological-science-pack-3", amount=1})


  data:extend(
  {
    vita_cable_recipe,
    vita_cable_tech,
  })
end