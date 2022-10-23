local data_util = require("data_util")

local naq_harvester_item = table.deepcopy(data.raw["item"]["se-void-probe"])
naq_harvester_item.name = data_util.mod_prefix .. "naquium-harvester"
naq_harvester_item.rocket_launch_product = {"se-naquium-ore", 0}
naq_harvester_item.subgroup = "naquium"
naq_harvester_item.order = "a-a-a-b"

local naq_harvester_recipe = table.deepcopy(data.raw["recipe"]["se-void-probe"])
naq_harvester_recipe.name = data_util.mod_prefix .. "naquium-harvester"
naq_harvester_recipe.ingredients = 
{
    {type="item", name="se-nanomaterial", amount=10},
    {type="item", name="se-antimatter-canister", amount=5},
    {type="item", name="se-quantum-processor", amount=3},
    {type="item", name="se-heavy-assembly", amount=3},
    {type="item", name="se-aeroframe-bulkhead", amount=15},
}
naq_harvester_recipe.results = 
{
    {type="item", name=naq_harvester_item.name, amount=1},
    {type="item", name="se-magnetic-canister", amount=5}
}
naq_harvester_recipe.main_product = naq_harvester_item.name

local naq_harvester_tech = table.deepcopy(data.raw["technology"]["se-antimatter-reactor"])
naq_harvester_tech.name = data_util.mod_prefix .. "naquium-harvester"
naq_harvester_tech.effects = {{type="unlock-recipe", recipe=naq_harvester_recipe.name}}
naq_harvester_tech.unit.count = data.raw["technology"]["se-antimatter-production"].unit.count / 2
naq_harvester_tech.icons = naq_harvester_item.icons

data:extend(
{
    naq_harvester_item,
    naq_harvester_recipe,
    naq_harvester_tech
})