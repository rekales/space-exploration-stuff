local data_util = require("data_util")

local biosludge_coal = table.deepcopy(data.raw["recipe"]["se-thermodynamics-coal"])
local coal_item = data.raw["item"]["coal"]
local biosludge_fluid = data.raw["fluid"]["se-bio-sludge"]

biosludge_coal.name = data_util.mod_prefix .. "biosludge-coal"
biosludge_coal.localised_name = {"recipe-name."..biosludge_coal.name}
biosludge_coal.ingredients = 
{
  { type="fluid", name="se-bio-sludge", amount=20},
  { type="fluid", name="se-plasma-stream", amount=5},
}

biosludge_coal.results = {{name="coal", amount=3}, {type="fluid", name="se-contaminated-space-water", amount=15}}
biosludge_coal.energy_required = 10
biosludge_coal.enabled = false
table.insert(data.raw["technology"]["se-space-catalogue-biological-1"].effects, {type="unlock-recipe", recipe=biosludge_coal.name})

biosludge_coal.icons = 
{
  {
    icon = coal_item.icon, 
    icon_size = coal_item.icon_size
  },
  {
    icon = biosludge_fluid.icon, 
    icon_size = biosludge_fluid.icon_size,
    scale = .25,
    shift = {-7,-7}
  }
}

data:extend(
{
    biosludge_coal,
})