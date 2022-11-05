if settings.startup["bioplastic"].value
then
  local data_util = require("data_util")
  -- mep = methane_epoxy_plastic
  local mep_recipe = table.deepcopy(data.raw["recipe"]["plastic-bar"])

  mep_recipe.enabled = false
  mep_recipe.ingredients = 
  {
    {name = "se-vitalic-epoxy", amount = 1},
    {type = "fluid", name = "se-methane-gas", amount = 400},
  }
  mep_recipe.name = data_util.mod_prefix .. "met-epoxy-plastic-bar"
  mep_recipe.results = {{name="plastic-bar", amount=100}}
  mep_recipe.energy_required = 40

  mep_recipe.icons = 
  {
    {
      icon = data.raw["item"]["plastic-bar"].icon,
      icon_size = data.raw["item"]["plastic-bar"].icon_size,
    },
    {
        icon = data.raw["item"]["se-vitalic-epoxy"].icon,
        icon_size = data.raw["item"]["se-vitalic-epoxy"].icon_size,
        scale = 0.25,
        shift = {-7,-7}
    }
  }

  table.insert(data.raw["technology"]["se-vitalic-epoxy"].effects, {type="unlock-recipe", recipe=mep_recipe.name})

  data:extend(
  {
    mep_recipe,
  }) 
end