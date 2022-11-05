-- control.lua

-- NOTE: I don't know the right technical terms for this things

-- instantiate Event
Event = {}
Event.listeners = {}  --key=defines.event, value={handlers}
Event.config_changed_listeners = {}

function Event.add_listener(defines, handler)

    if not Event.listeners[defines]
    then
        Event.listeners[defines] = {}
    end
    table.insert(Event.listeners[defines], handler)
end

-- -- add tick_schedule on Event
-- function Event.schedule_tick(schedule_ticks, handler)
--     table.insert(global.tick_schedule, {ticks=schedule_ticks, handler=handler})
-- end

-- -- add scheduler listener
-- Event.add_listener(defines.events.on_tick, function(event)
--     for schedule_index,scheduled_event in pairs(global.tick_schedule)
--     do
--         scheduled_event.ticks = scheduled_event.ticks - 1
--         if scheduled_event.ticks <= 0
--         then
--             scheduled_event.handler(event)
--             table.remove(global.tick_schedule, schedule_index)
--         end
--     end
-- end)

function Event.add_config_changed_listener(handler)
    table.insert(Event.config_changed_listeners, handler)
end

-- execute scripts
require("scripts/anti_ore_regen.lua")
require("scripts/cancel_pollution_emission.lua")
require("scripts/renewable_naquium.lua")

-- trigger on_config_changed
script.on_configuration_changed(function()
    for _,listener in pairs(Event.config_changed_listeners)
    do
        listener()
    end
end)

-- trigger handlers
for defines,handlers in pairs(Event.listeners)
do
    script.on_event(defines, 
    function(event)
        for _,handler in pairs(handlers)
        do
            handler(event)
        end
    end)
end

script.on_init(function()
    global.tick_schedule = {}   --value={ticks=number, handler=function}
    global.depleted_chunks = {}  --key=position.x, value={position.y=bool}
end)