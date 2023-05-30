local data_util = require("data_util")

if not settings.startup[data_util.mod_prefix.."empty-space-train-stop"].value
then return end

for _,p in pairs(data.raw["train-stop"])
do
    if p.name == "se-space-elevator-train-stop"
    then
        goto continue
    end

    p.collision_mask = {"item-layer", "floor-layer", "water-tile", "player-layer"}
    
    ::continue::
end

if mods["train-pubsub"]
then
    data.raw["constant-combinator"]["train-config"].collision_mask = {"item-layer", "floor-layer", "water-tile", "player-layer"}
    data.raw["constant-combinator"]["train-counter"].collision_mask = {"item-layer", "floor-layer", "water-tile", "player-layer"}
    data.raw["lamp"]["train-publisher"].collision_mask = {"item-layer", "floor-layer", "water-tile", "player-layer"}
end