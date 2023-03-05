-- Set the list of fluids to monitor
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

-- Set the default suffix keyword
local suffix_keyword = "barrel"

-- Function to update the keyword prefix based on input signals
function setKeywordPrefix()
  local fill_signal = green["signal-F"] or 0
  local empty_signal = green["signal-E"] or 0
  
  if fill_signal > 0 then
    prefix_keyword = "fill"
  elseif empty_signal > 0 then
    prefix_keyword = "empty"
  else
    prefix_keyword = ""
  end
end

-- Initialize the keyword prefix
setKeywordPrefix()

-- Loop through each fluid and check for input signals
for _, fluid_name in pairs(fluids) do
  local input_signal = red[fluid_name] or 0
  
  -- Check if the input signal is greater than 0
  if input_signal > 0 then
    -- Create the output signal name with prefix and suffix keywords
    local output_signal = fluid_name
    if prefix_keyword ~= "" then
      output_signal = prefix_keyword .. "-" .. output_signal
    end
    if suffix_keyword ~= "" then
      output_signal = output_signal .. "-" .. suffix_keyword
    end
    
    -- Set the output signal value
    out[output_signal] = input_signal
  else
    -- Set all output signals to 0 for that fluid
    for signal_name, _ in pairs(out) do
      if string.find(signal_name, "^.*" .. fluid_name .. ".*$") then
        out[signal_name] = 0
      end
    end
  end
end
