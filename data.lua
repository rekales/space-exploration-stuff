--data.lua

if settings.startup["bioplastic"].value then require("prototypes/bioplastic.lua") end
if settings.startup["methane-rocket-fuel"].value then require("prototypes/methane_rocket_fuel.lua") end
if settings.startup["biosludge-coal"].value then require("prototypes/biosludge_coal.lua") end
if settings.startup["antimatter-rocket-fuel"].value then require("prototypes/antimatter_rocket_fuel.lua") end
if settings.startup["matter-fusion-viability"].value then require("prototypes/matter_fusion_viability.lua") end
if settings.startup["belt-uncoloring"].value then require("prototypes/deep_space_belt_uncoloring.lua") end
if settings.startup["cancel-pollution-emission"].value then require("prototypes/cancel_pollution_emission.lua") end
if settings.startup["pyroflux-hotter-steam"].value then require("prototypes/pyroflux_hotter_steam.lua") end
