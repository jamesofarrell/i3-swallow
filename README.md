# i3-swallow
used to swallow (send to the scratchpad) a window after a blocking application is run in i3. Requires [i3ipc-python](https://github.com/acrisci/i3ipc-python/).

## usage
i3-swallow [-d] [-f] [-b num]
 -d Don't return swallowed window on exit  
 -f force swallow, do not swap already swallowed window
 -b Increase border size of window marked for swallow

i3-swallow has changed from theprevious version. It is now designed to be bound to a key and mark any window for swallow.

If you want to call it from the command line before a command create this alias:

    alias sw='i3-swallow & sleep 0.1; '

and then run with:

    sw command -some -arguments

## demo
![demo](https://zippy.gfycat.com/HandmadeBasicHoneybadger.gif)

