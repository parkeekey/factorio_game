--the autobarrel fluid handler script MODDED version, Not work in vanilla 
--will turn any red wire input that are fluild items
--match with the local fluids { } 
--then it will manipulate the string name so it will give you 3 signals
--FILL the barrel, EMPTY the barrel, REQUEST that barrel. 

--YOU CAN UPDATE YOUR OWN FLUIDS ITEMS IN THE CODE local fluids { } 
--RECOMMEND MODS 
--recommend to use with Pipe Meter mod to read the fluid signal in pipe
--recommed to use with Crafting combinator to WRITE the signal to Assembler machine! 
--HAPPY BARRELLING!

--the list of fluids are consist of vanilla game, K2 mod and Darkstar mod
--to demeonstrate that it works. 

local fluids = {
  "water",
  "blood",
  "tar",
  "aizhan-matter",
  "antithetical-matter",
  "copper-sulfate",
  "crude-oil",
  "cyclopentadiene",
  "dark-matter",
  "norbornadiene",
  "quadricyclane",
  "quantum-waste",
  "heavy-oil",
  "light-oil",
  "fish-oil",
  "petroleum-gas",
  "alien-ooze",
  "sulfuric-acid",
  "sludge",
  "blue-crude",
  "lubricant",
  "hydrogen",
  "oxygen",
  "mineral-water",
  "chlorine",
  "dirty-water",
  "nitrogen",
  "ammonia",
  "nitric-acid",
  "hydrogen-chloride",
  "biomethanol",
  "Mineral-Liquid"
}
local empty_barrel_signal = red["empty-barrel"] or 0
local signal_E = green["signal-E"] or 0
local signal_F = green["signal-F"] or 0

for _, fluid_name in pairs(fluids) do
  local input_signal = red[fluid_name] or 0

  if empty_barrel_signal == 1 then
    out["fill-" .. fluid_name .. "-barrel"] = signal_F == 1 and input_signal or 0
    out["empty-" .. fluid_name .. "-barrel"] = signal_E == 1 and input_signal or 0
    out[fluid_name .. "-barrel"] = input_signal
  elseif empty_barrel_signal == 2 then
    out["fill-" .. fluid_name .. "-pallet"] = signal_F == 1 and input_signal or 0
    out["empty-" .. fluid_name .. "-pallet"] = signal_E == 1 and input_signal or 0
    out[fluid_name .. "-pallet"] = input_signal
  elseif empty_barrel_signal == 3 then
    out["fill-" .. fluid_name .. "-ibc"] = signal_F == 1 and input_signal or 0
    out["empty-" .. fluid_name .. "-ibc"] = signal_E == 1 and input_signal or 0
    out[fluid_name .. "-ibc"] = input_signal
  elseif empty_barrel_signal == 4 then
    out["fill-" .. fluid_name .. "-tank"] = signal_F == 1 and input_signal or 0
    out["empty-" .. fluid_name .. "-tank"] = signal_E == 1 and input_signal or 0
    out[fluid_name .. "-tank"] = input_signal
  else
    -- Handle other cases or leave empty based on your requirements
    out["fill-" .. fluid_name .. "-barrel"] = 0
    out["fill-" .. fluid_name .. "-pallet"] = 0
    out["fill-" .. fluid_name .. "-ibc"] = 0
    out["fill-" .. fluid_name .. "-tank"] = 0
    out["empty-" .. fluid_name .. "-barrel"] = 0
    out["empty-" .. fluid_name .. "-pallet"] = 0
    out["empty-" .. fluid_name .. "-ibc"] = 0
    out["empty-" .. fluid_name .. "-tank"] = 0
    out[fluid_name .. "-barrel"] = 0
    out[fluid_name .. "-pallet"] = 0
    out[fluid_name .. "-ibc"] = 0
    out[fluid_name .. "-tank"] = 0
  end
end
