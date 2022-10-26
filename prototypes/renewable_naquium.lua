local data_util = require("data_util")

local neutral_fragment = data.raw["item"]["se-core-fragment-omni"]
local naquium_ore = data.raw["item"]["se-naquium-ore"]
local naq_clump_item = table.deepcopy(data.raw["item"]["se-naquium-ore"])
naq_clump_item.name = data_util.mod_prefix .. "naquium-clump"
naq_clump_item.subgroup = "naquium"
naq_clump_item.stack_size = 20
naq_clump_item.order = "a-a-a-a-b"
naq_clump_item.icons = 
{
    {icon=neutral_fragment.icons[1].icon, icon_size=neutral_fragment.icons[1].icon_size, tint={0.9,0.9,0.9,1}},
    {icon=naquium_ore.icon, icon_size=naquium_ore.icon_size, tint={0.6,0.6,0.6,0.6}}
}

local naq_clump_processing_recipe = 
{
    name = data_util.mod_prefix .. "naquium-clump-processing",
    type = "recipe",
    category = "space-thermodynamics",
    ingredients = 
    {
        {type="item", name=naq_clump_item.name, amount=20},
        {type="fluid", name="se-plasma-stream", amount=50},
    },
    results = 
    {
        {type="item", name="se-naquium-ore", amount=30},
        {type="item", name="stone", amount=5},
    },
    main_product = "se-naquium-ore",
    energy_required = 20,
    hidden = true
}

local naq_harvester_item = table.deepcopy(data.raw["item"]["se-void-probe"])
naq_harvester_item.name = data_util.mod_prefix .. "naquium-harvester"
naq_harvester_item.rocket_launch_product = {naq_clump_item.name, 0}
naq_harvester_item.subgroup = "naquium"
naq_harvester_item.order = "a-a-a-b"
naq_harvester_item.icons[1].tint = {0.7,0.7,0.8,1}

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
naq_harvester_tech.effects = 
{
    {type="unlock-recipe", recipe=naq_harvester_recipe.name},
    {type="unlock-recipe", recipe=naq_clump_processing_recipe.name},
}
naq_harvester_tech.unit.count = data.raw["technology"]["se-antimatter-production"].unit.count / 2
naq_harvester_tech.icons = naq_harvester_item.icons

data:extend(
{
    naq_clump_item,
    naq_clump_processing_recipe,
    naq_harvester_item,
    naq_harvester_recipe,
    naq_harvester_tech
})