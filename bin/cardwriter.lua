local component = require("component")
local term = require("term")
local event = require("event")
local m = component.modem 
local encryptKey = "ThWmZq4t7w!z%C*F"
local random5 = "p2s5v8y/B?E(H+Kb"
writer = component.os_cardwriter
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

print("Auth")
print()
io.write("Username: ")
u = io.read()
print()
io.write("Password: ")
p = io.read()
print()
mm = "validate " .. u .. " " .. p
m.broadcast(555, mm)

print("Validating...")
local _, _, from, port, _, message = event.pull("modem_message")
r = split(tostring(message), "-")
if r[1] == "Auth Successful" then
  s = component.data.encode64(u .. "," .. p)
  print(s)
  writer.write(s,u, true)
else 
  print("Failed to Validate")
end
