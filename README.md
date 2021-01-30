# EveBlinds  

Made for Sam! And Sam only!

## Usage

Drop down some blinds, link them up and then:

- Add the **master** script into the **root** prim. That also should be the prim that NEVER moves. So the inner most one.
- Add the **slave** script into all the other linked blinds.
- Reset the **master** script to start the initialization. This means that the slave blinds will be moved to an initial position relative to the root prim (master). If you dont like the offset, then you can edit that in the `performSetup` function of the master script. Look for the vector in the `llSetLinkPrimitiveParamsFast` call.

Now play around with the `blindOffsetWhenOpened` variable in the **master** script. `blindOffsetWhenOpened` will determ the open position of the opened slave blinds.

I suggest you layout the blind prims so you know how many you need, then link them up, then add the scripts and then play around with the `blindOffsetWhenOpened`.

Remember to make the non moving blind (the one on the corners) the root prim!

---

❤ Made by evelin
