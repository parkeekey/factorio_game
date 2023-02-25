-- List of signals to search
local red_signals = {}

-- Define the keywords to filter
local keywords = {""}
--type the word you want to filter! empty keyword will store and output all signal as regular memcell. 
--press  save to update the keyword filter
--and signal X on green wire input to update the script!

-- Function to filter signals based on keyword
function filterSignalsByKeyword(signals, keywords)
    local filteredSignals = {}
    for signalName, signalCount in pairs(signals) do
        for _, keyword in ipairs(keywords) do
            if string.match(signalName, keyword) then
                filteredSignals[signalName] = signalCount
                break
            end
        end
    end
    return filteredSignals
end

-- Loop over the red table and store numerical signal values in red_signals table
for signal_name, signal_value in pairs(red) do
  if type(signal_value) == "number" and signal_name ~= "signal-R" then
    red_signals[signal_name] = signal_value
  end
end

-- Filter signals that contain the keywords
local filteredSignals = filterSignalsByKeyword(red_signals, keywords)

-- Output stored signal values to out table
for signal_name, signal_value in pairs(filteredSignals) do
  out[signal_name] = tonumber(signal_value) or 0
end

-- Clear stored signal values when signal-R is present
if green["signal-X"] == 1 then
  for signal_name, _ in pairs(out) do
    out[signal_name] = nil
  end
end
