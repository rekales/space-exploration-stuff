local data_util = require("data_util")

data.raw["mining-drill"]["se-core-miner-drill"].mining_speed = 
  data.raw["mining-drill"]["se-core-miner-drill"].mining_speed * 
  settings.startup[data_util.mod_prefix.."core-miner-speed-multiplier"].value