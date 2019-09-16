import os
from sys import argv

import neovim

def main(cmd, args):
    nvim = neovim.attach("socket", path=os.environ["NVIM_LISTEN_ADDRESS"])
    if cmd == "lcd":
        nvim.command("lcd " + os.getcwd())
    if cmd == "tcd":
        nvim.command("tcd " + os.getcwd())
    if cmd == "edit":
        if args != []:
            nvim.command("edit " + args[0])
            for arg in args[1:]:
                nvim.command("badd " + arg)

main(argv[1], argv[2:])
