local data_util = require("data_util")

local naq_harvester = table.deepcopy(data.raw["item"]["se-void-probe"])
naq_harvester.name = data_util.mod_prefix .. "naquium-harvester"
naq_harvester.rocket_launch_product = {"se-naquium-ore", 0}
naq_harvester.subgroup = "naquium"

data:extend(
{
    naq_harvester,
})