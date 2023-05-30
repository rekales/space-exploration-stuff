

for _,p in pairs(data.raw["train-stop"])
do
    if p.name == "se-space-elevator-train-stop"
    then
        goto continue
    end

    p.collision_mask = {"item-layer", "floor-layer", "water-tile", "player-layer",}
    
    ::continue::
end