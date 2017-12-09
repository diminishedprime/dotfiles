#!/usr/bin/env python3

import i3ipc
import Tkinter
import sys
import re
from functools import reduce

def parse_entry(acc, entry):
    key, value = entry.split("=")
    acc[key] = value
    return acc

def parse_args(args):
    rest = args[1:]
    arg_map = reduce(parse_entry, rest, {})
    return arg_map
args = parse_args(sys.argv)

i3 = i3ipc.Connection()
def center(toplevel):
    toplevel.update_idletasks()
    w = toplevel.winfo_screenwidth()
    h = toplevel.winfo_screenheight()
    size = tuple(int(_) for _ in toplevel.geometry().split('+')[0].split('x'))
    x = w/2 - size[0]/2
    y = h/2 - size[1]/2
    toplevel.geometry("%dx%d+%d+%d" % (size + (x, y)))

def show_window(label_list):
    fontName = args.get("--font", "Arial")
    fontSize = int(float(args.get("--font_size", "12")))
    regexFilter = args.get("--ignore_titles", "$^")
    regex = re.compile(regexFilter)
    if (regex.match(label_list[0]) != None):
        return
    root = Tkinter.Tk()
    root.attributes("-type", "dock")
    width = int(float(args.get("--min_width", "500")))
    root.minsize(width=width, height=1)
    labelText = reduce(lambda acc, s: acc + '\n' + s, label_list[1:])
    label = Tkinter.Label(root, text=labelText, justify=Tkinter.LEFT, anchor='w')
    foreground=args.get("--foreground", "#000000")
    background=args.get("--background", "#ffffff")
    label.config( font=(fontName, fontSize)
                , background=background
                , foreground=foreground)
    label.pack(fill='both')
    root.title("i3-pretty-mode-title")
    center(root)
    # TODO(me)figure out scaling
    #root.tk.call('tk', 'scaling', 4.0)
    return root

def destroy_root():
    global lastRoot
    if (lastRoot != None):
        lastRoot.destroy()
        lastRoot = None

lastRoot = None
def on_mode(i3, e):
    global lastRoot
    mode_string = e.change
    destroy_root()
    if (mode_string != "default"):
        label_list = mode_string.split(" :: ")
        lastRoot = show_window(label_list)


# Subscribe to "mode" events
i3.on("mode", on_mode)

# Start the main loop and wait for events to come in.
i3.main()

