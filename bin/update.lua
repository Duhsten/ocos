local internet = require("internet")
local shell = require("shell")
local term = require("term")
local computer = require("computer")

local handle = internet.request("https://raw.githubusercontent.com/Duhsten/ocos/version/latestversion")
local result = ""
term.clear()
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

for chunk in handle do result = result..chunk end
-- Print the body of the HTTP response
local f1 = assert(io.open("../etc/version", "r"))
v = f1:read("*all")
f1:close()
print("Checking For Updates")
print("Latest Version: " .. result)

currentVersion = split(v, ".")
latestVersion = split(result, ".")

function updateOS(latest)
  shell.execute("wget -f https://raw.githubusercontent.com/Duhsten/ocos/version/os.tar")
  shell.execute("mv os.tar ../os.tar")
  print("Updating OS")
  shell.execute("cd ../ ; tar -f -x os.tar ; rm os.tar")
  print("Update Complete - " .. result)
  print("Would you like to restart now? (Y/n)")
  x = io.read()
  if x == "y" or x == "Y" then
    computer.shutdown(true)
  end

end

u = false
for x in pairs(latestVersion) do
  if latestVersion[x] ~= nil then
    if tonumber(latestVersion[x]) > tonumber(currentVersion[x]) then
      print("New Version Avaliable")
      u = true
      print("Would you like to update now? (Y/n)")
      r = io.read()
      if r == "Y" or r == "y" then
        updateOS(result)
      end
    end
  end
end
if u == false then
  print("Currently up to date")
end