if settings.startup["methane-rocket-fuel"].value 
then 
  local data_util = require("data_util")

  --mrf = methane_rocket_fuel
  local mrf_recipe = table.deepcopy(data.raw["recipe"]["rocket-fuel"])
  local lrf_fluid = data.raw["fluid"]["se-liquid-rocket-fuel"]
  local mg_fluid = data.raw["fluid"]["se-methane-gas"]

  mrf_recipe.name = data_util.mod_prefix .. "methane-rocket-fuel"
  mrf_recipe.category = "fuel-refining"
  mrf_recipe.subgroup = "fuel"
  mrf_recipe.ingredients = 
  {
    { type="fluid", name="se-methane-gas", amount=250},
  }

  mrf_recipe.results = {{type="fluid", name="se-liquid-rocket-fuel", amount=50}}
  mrf_recipe.energy_required = 1
  mrf_recipe.enabled = false

  mrf_recipe.icons = 
  {
    {icon="__space-exploration-graphics__/graphics/blank.png", scale=0.5, shift={0,0}, icon_size = 64},
    {icon=lrf_fluid.icon, scale=0.33*64/lrf_fluid.icon_size, shift={-8,8}, icon_size=lrf_fluid.icon_size},
    {icon=mg_fluid.icon, scale=0.33*64/mg_fluid.icon_size, shift={8,-8}, icon_size=mg_fluid.icon_size},
    {icon="__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale=0.5, shift={0,0}, icon_size=64},
  }

  table.insert(data.raw["technology"]["se-processing-methane-ice"].effects, {type="unlock-recipe", recipe=mrf_recipe.name})

  data:extend(
  {
    mrf_recipe,
  })
end