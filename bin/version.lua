local f1 = assert(io.open("../etc/version", "r"))
v = f1:read("*all")
f1:close()

print("Trikon OS - Version " .. v)