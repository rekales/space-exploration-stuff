--data-final-fixes.lua

if settings.startup["more-wdc-ammo"].value then require("prototypes/more_wdc_ammo.lua") end
if settings.startup["simplified-delivery-capsule"].value then require("prototypes/simplified_delivery_capsule") end
if settings.startup["neutral-core-landfill"].value then require("prototypes/neutral_core_landfill.lua") end

require("prototypes/cannonable_nuclear_fuel.lua")