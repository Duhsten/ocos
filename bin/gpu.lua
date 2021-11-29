local shell = require("shell")
local keyboard = require("keyboard")
local component = require("component")
local gpu = component.gpu -- get primary gpu component
local w, h = gpu.getResolution()

local isAuth = false

function initUI()
  local f1 = assert(io.open("../etc/version", "r"))
  v = f1:read("*all")
  f1:close()
  gpu.setForeground(0xFFFFFF)
  gpu.setBackground(0x333333)
  gpu.fill(1, 1, w, h, " ") -- clears the screen
  gpu.setBackground(0x333FFF)
  gpu.fill(1, 1, 10, 1, " ")
  gpu.set(1,1, "Trikon OS v" .. v)
end

function authUser()
  gpu.setForeground(0xFFFFFF)
  gpu.setBackground(0x333333)
  gpu.setBackground(0xFF3F33)
  gpu.fill(1, 4, 10, 1, " ")
  gpu.set(1,4, "User Login")
  gpu.setForeground(0xFFFFFF)
  gpu.setBackground(0x333333)
  io.write("Username: ")
  u = io.read()
  io.write("Password: ")
  p = io.read()
  isAuth = true;


end

function loadMenu()
  initUI()
  gpu.setBackground(0xFFFFFF)
  gpu.setForeground(0xFFFFFF)
  gpu.fill(1, 4, 10, 1, " ")
  gpu.set(1,4, "Main Menu")
  gpu.setForeground(0xFFFFFF)
  gpu.setBackground(0x333333)

end


while true do
  initUI()
  if isAuth == false then
    authUser()
  elseif isAuth == true then
    loadMenu()
  end
end

