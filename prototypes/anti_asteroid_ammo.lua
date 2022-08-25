local data_util = require("data_util")

local aa_ammo = table.deepcopy(data.raw["ammo"]["firearm-magazine"])
aa_ammo.name = data_util.mod_prefix .. "anti-asteroid-ammo"
aa_ammo.order = data.raw["ammo"]["uranium-rounds-magazine"].order
aa_ammo.icon = "__space-exploration-stuff__/graphics/icons/anti-asteroid-ammo.png"
aa_ammo.icon_size = 64

local aa_ammo_recipe = table.deepcopy(data.raw["recipe"]["firearm-magazine"])
aa_ammo_recipe.name = data_util.mod_prefix .. "anti-asteroid-ammo"
-- aa_ammo_recipe.localised_name = {"recipe-name."..biosludge_coal.name}
aa_ammo_recipe.ingredients = 
{
  { type="item", name="piercing-rounds-magazine", amount=10},
  { type="item", name="se-self-sealing-gel", amount=1},
  { type="item", name="se-vitalic-reagent", amount=2},
}

aa_ammo_recipe.results = {{type="item", name=aa_ammo.name, amount=10}}
aa_ammo_recipe.energy_required = 50
aa_ammo_recipe.enabled = false
-- table.insert(data.raw["technology"]["se-space-catalogue-biological-1"].effects, {type="unlock-recipe", recipe=aa_ammo_recipe.name})

data:extend({aa_ammo, aa_ammo_recipe})