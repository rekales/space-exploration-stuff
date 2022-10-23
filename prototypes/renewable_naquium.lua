local data_util = require("data_util")

local naq_harvester_item = table.deepcopy(data.raw["item"]["se-void-probe"])
naq_harvester_item.name = data_util.mod_prefix .. "naquium-harvester"
naq_harvester_item.rocket_launch_product = {"se-naquium-ore", 0}
naq_harvester_item.subgroup = "naquium"

-- local naq_harvester_recipe = 

data:extend(
{
    naq_harvester_item,
})