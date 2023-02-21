--Lua scripted for memory cell in Factorio game
--working with Moon logic combinator mod
--RED wire input for any signal you want to create or update
--GREEN wire input, set signal R1. Activate the signal will RESET store signal

--just copy and paste! 

local red_signals = {}

-- Loop over the red table and store numerical signal values in red_signals table
for signal_name, signal_value in pairs(red) do
  if type(signal_value) == "number" and signal_name ~= "signal-R" then
    red_signals[signal_name] = signal_value
  end
end

-- Output stored signal values to out table
for signal_name, signal_value in pairs(red_signals) do
  out[signal_name] = tonumber(signal_value) or 0
end

-- Clear stored signal values when signal-R is present
if green["signal-R"] == 1 then
  for signal_name, _ in pairs(out) do
    out[signal_name] = nil
  end
end
