local shell = require("shell")

shell.execute("cd /bin/ ; wget -f https://raw.githubusercontent.com/Duhsten/ocos/main/bin/tar.lua")
shell.execute("cd ../ ; wget -f https://raw.githubusercontent.com/Duhsten/ocos/version/os.tar")
shell.execute("cd ../ ; tar -f -x os.tar ; rm os.tar")
print("Trikon OS Installed - Restarting")
os.sleep(2)
computer.shutdown(true)