local data_util = require("data_util")

if settings.startup[data_util.mod_prefix.."pyroflux-hotter-steam"].value 
then 
  local pyro_steam_recipe = table.deepcopy(data.raw["recipe"]["se-pyroflux-steam"])

  pyro_steam_recipe.name = data_util.mod_prefix .. "pyroflux-hotter-steam"
  pyro_steam_recipe.ingredients = 
  {
    { type="fluid", name="water", amount=150 },
    { type="fluid", name="se-pyroflux", amount=5 }
  }

  table.remove(pyro_steam_recipe.results, 1)
  table.insert(pyro_steam_recipe.results, {type="fluid", name="steam", amount=150, temperature = 500})

  data:extend(
  {
    pyro_steam_recipe,
  })
end