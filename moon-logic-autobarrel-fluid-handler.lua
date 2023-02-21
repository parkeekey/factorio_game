--the autobarrel fluid handler script
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
  "fish-oil",f
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
}

for _, fluid_name in pairs(fluids) do
  local input_signal = red[fluid_name] or 0

  if input_signal > 0 then
    out["fill-" .. fluid_name .. "-barrel"] = input_signal
    out["empty-" .. fluid_name .. "-barrel"] = input_signal
    out[fluid_name .. "-barrel"] = input_signal
  else
    out["fill-" .. fluid_name .. "-barrel"] = 0
    out["empty-" .. fluid_name .. "-barrel"] = 0
    out[fluid_name .. "-barrel"] = 0
  end
end
