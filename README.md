AutoHotKey Scripts
By Josh Moore

Antimatter Dimensions
https://github.com/melophat/autoHotKeyScripts/blob/master/antimatter_dimensions.ahk

This script is used to automate the game Antimatter Dimensions to allow you to get through it a lot quicker than doing it manually.  It includes a decent amount of configurable options, along with some sanity checks to make sure that you don't enable conflicting options for hotkeys, etc.  As the game developer (not me) adds features or makes more hotkeys available, I'll do my best to update this script.  I make no guarantees about the frequency of updates or bug fixes, especially once I get bored of the game, lol.

Features and Usage:
* F3 starts the script
* F4 stops the script
* Set "enableDebug" option to true in the script to see what keystrokes are being sent for each loop.
* Set "testRun" to true to view the keystrokes being sent without actually sending them.  Useful for tuning offset values and making sure that your config changes are sending what you want them to. (automatically sets "enableDebug" to true so you can see messages)
* Defaults to "useMaxAll" = true, which is essentially just always buying max of anything you can.  
* To buy only specific dimensions, set "useMaxAll" to false and then set the individual dimensions you want to buy to true in config.
* You can enable/disable the buying of Sacrifices, Galaxies, Dimensional Boosts, and Big Crunches independantly.
* For Sacrifices and Dimensional Boosts, you can enable offsets for each independantly which makes it so that you can set the frequency those items are purchased. ("offsetS" and "offsetD" config options)
* If you enable offsets, you can set the frequency of Sacrifices and Dimensional Boosts with the "SOffsetValue" and "DOffsetValue" config settings respectively.

Issues/Quirks:
* This will only run in the currently active and selected Browser window and tab.  It does not take advantage of AutoHotKey's window targeting functionality, as it's buggy as hell in Chrome with multiple windows/tabs. (will potentially update for other browsers if I get the time or enough requests)
