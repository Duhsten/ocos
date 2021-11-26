event = require("event")
local component = require("component")
local term = require("term")
local event = require("event")
local m = component.modem 
local accessLvl = 4
m.open(551)
function split (inputstr, sep)
  if sep == nil then
          sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          table.insert(t, str)
  end
  return t
end
function myFunction(eventName, address, playerName, cardData, cardUniqueId, isCardLocked, side)
    print("player " .. playerName .. " used card " .. cardUniqueId .. ", data: " .. cardData)
    print("Validating Card...")
    m.broadcast(555, "validateCard " .. cardData .. " " .. accessLvl)
    local _, _, from, port, _, message = event.pull("modem_message")

    r = split(tostring(message), "-")
    if r[1] == "Auth Successful" then
      print("Card Validated")
      -- Open Door
    else
        print("Failed to Validate - " .. r[2])
    end
end
local eventName, address, playerName, cardData, cardUniqueId, side = event.pull("magData")
myFunction(eventName, address, playerName, cardData, cardUniqueId, side)

