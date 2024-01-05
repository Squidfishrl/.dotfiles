import math
import textwrap

from i3ipc.aio import Connection 
from i3ipc import Event
from pathlib import Path

import asyncio
import requests

# doesn't work since event waits for return?
REQUEST_MUTEX = False

QUOTE_BUFFER_AMOUNT = 20
QUOTE_BUFFER = {}
BUFFER_POS = math.inf
FILE_PATH = str(Path('~').expanduser()) + "/.config/conky/quote.txt"

def get_quote():
    global BUFFER_POS, QUOTE_BUFFER, FILE_PATH
    if BUFFER_POS >= QUOTE_BUFFER_AMOUNT:
        response = requests.get("https://api.quotable.io/quotes/random?limit=" + str(QUOTE_BUFFER_AMOUNT))
        QUOTE_BUFFER = response.json()
        BUFFER_POS = 0

    content = QUOTE_BUFFER[BUFFER_POS]
    BUFFER_POS += 1
    content["content"] = "\n".join(textwrap.wrap(content["content"], width=33))

    with open(FILE_PATH, "w") as file:
        file.write(content["content"] + "\n\n- " + content["author"])

    return content["content"], content["author"]

async def main():
    i3 = await Connection().connect()

    def on_conky_quote_event(i3, event):
        global REQUEST_MUTEX
        print(event.binding.event_state_mask)
        print(event.binding.symbol)
        if event.binding.symbol != 'q' or event.binding.event_state_mask!= ["Mod1"]:
            return


        if REQUEST_MUTEX:
            return

        REQUEST_MUTEX = True
        print(get_quote()[0])
        REQUEST_MUTEX = False

    i3.on(Event.BINDING, on_conky_quote_event)

    await i3.main()


asyncio.get_event_loop().run_until_complete(main())


