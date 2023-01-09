local data_util = require("data_util")

if settings.startup[data_util.mod_prefix.."antimatter-rocket-fuel"].value 
then 
  --arf = antimatter_rocket_fuel
  local arf_recipe = table.deepcopy(data.raw["recipe"]["rocket-fuel"])
  local rf_item = data.raw["item"]["rocket-fuel"]
  local am_fluid = data.raw["fluid"]["se-antimatter-stream"]

  arf_recipe.name = data_util.mod_prefix .. "antimatter-rocket-fuel"
  arf_recipe.category = "space-collider"
  arf_recipe.subgroup = "fuel"
  arf_recipe.icon = "__base__/graphics/icons/rocket-fuel.png"
  arf_recipe.icon_size = 64
  arf_recipe.ingredients = 
  {
    {type="fluid", name="se-antimatter-stream", amount=1000},
    {type="fluid", name="se-particle-stream", amount=1000},
    {name="se-iridium-plate", amount=10},
    {name="se-superconductive-cable", amount=2},
  }
  arf_recipe.results = 
  {
    {type="item", name="rocket-fuel", amount=400},
    {type="item", name="se-scrap", amount=5},
  }
  arf_recipe.energy_required = 100
  arf_recipe.enabled = false

  arf_recipe.icons = 
  {
    {icon="__space-exploration-graphics__/graphics/blank.png", scale=0.5, shift={0,0}, icon_size = 64},
    {icon=rf_item.icon, scale=0.33*64/rf_item.icon_size, shift={-8,8}, icon_size=rf_item.icon_size},
    {icon=am_fluid.icon, scale=0.33*64/am_fluid.icon_size, shift={8,-8}, icon_size=am_fluid.icon_size},
    {icon="__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale=0.5, shift={0,0}, icon_size=64},
  }


  local antimatter_production_tech = data.raw["technology"]["se-antimatter-production"]
  local arf_tech = table.deepcopy(data.raw["technology"]["rocket-fuel"])
  arf_tech.name = arf_recipe.name
  arf_tech.effects = {{type="unlock-recipe", recipe=arf_recipe.name}}
  arf_tech.prerequisites = {antimatter_production_tech.name}
  arf_tech.unit.count = antimatter_production_tech.unit.count / 4
  arf_tech.unit.time = antimatter_production_tech.unit.time
  arf_tech.unit.ingredients = table.deepcopy(antimatter_production_tech.unit.ingredients)

  arf_tech.icons = 
  {
    {
      icon = arf_tech.icon, 
      icon_size = arf_tech.icon_size,
      shift = {12,12}
    },
    {
      icon = am_fluid.icon, 
      icon_size = am_fluid.icon_size,
      scale = 2,
      shift = {-64,-64}
    }
  }

  data:extend(
  {
    arf_recipe,
    arf_tech,
  })
end