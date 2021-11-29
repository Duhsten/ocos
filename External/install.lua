local shell = require("shell")

shell.execute("cd /bin/ ; wget -f https://raw.githubusercontent.com/Duhsten/ocos/main/bin/tar.lua")
shell.execute("wget -f https://raw.githubusercontent.com/Duhsten/ocos/version/os.tar")