local data_util = require("data_util")

local matter_stream_pipe_entity = table.deepcopy(data.raw["pipe"]["se-space-pipe"])
local matter_stream_pipe_item = table.deepcopy(data.raw["pipe"]["se-space-pipe"])

matter_stream_pipe_entity.name = data_util.mod_prefix .. "matter_stream_pipe"
matter_stream_pipe_entity.minable.result = data_util.mod_prefix .. "matter_stream_pipe"

matter_stream_pipe_item.name = data_util.mod_prefix .. "matter_stream_pipe"
matter_stream_pipe_item.place_result = data_util.mod_prefix .. "matter_stream_pipe"

data:extend(
{
  matter_stream_pipe_entity,
  matter_stream_pipe_item,
}
)