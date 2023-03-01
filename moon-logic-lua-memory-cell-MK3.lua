-- List of signals to search
local red_signals = {}

-- Define the keywords to filter
local keywords = {""}

-- Define the signals to remove
local remove_signal = {"uranium"}

-- Define the signals to blacklist
local blacklist = {"coal"}

-- Define the new signals to create
local new_signal = {"iron-ore=1","#steel-plate=1"}

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

-- Remove signals when signal-X is present and remove_signal is not empty
if green["signal-X"] == 2 and next(remove_signal) then
  for signal_name, _ in pairs(out) do
    for _, remove_name in ipairs(remove_signal) do
      if string.match(signal_name, remove_name) then
        out[signal_name] = nil
      end
    end
  end
end

-- Clear stored signal values when signal-X is present
if green["signal-X"] == 1 then
  for signal_name, _ in pairs(out) do
    out[signal_name] = nil
  end
end

-- Blacklist signals
for _, blacklist_name in ipairs(blacklist) do
  for signal_name, _ in pairs(out) do
    if string.match(signal_name, blacklist_name) then
      out[signal_name] = nil
    end
  end
end

-- Create new signals when signal-W is present
if green["signal-W"] == 1 then
  for _, new_signal_name in ipairs(new_signal) do
    local name, value = new_signal_name:match("^(.+)=(%d+)$")
    if not (remove_signal and table.concat(remove_signal, " "):find(name)) and not (blacklist and table.concat(blacklist, " "):find(name)) then
      out[name] = tonumber(value)
    end
  end
end
