cd ~/.config/conky
cp default-quote.txt quote.txt 
conky -c quotes-config.lua
source i3ipc/venv/bin/activate && python3 i3ipc/keybinding_listener.py
