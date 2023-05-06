# BLV_Klicky
Kicky probe implementation for the metal kit BLV cube

![alt text](https://github.com/rab1515/BLV_Klicky/blob/main/Photos/Capture1.PNG)

This probe is designed to fit the metal kit, with the NFSunrise hotend, most hotends will also work as well.

# Print Settings
Print in the orientation shown below:
![alt text](https://github.com/rab1515/BLV_Klicky/blob/main/Photos/Capture3.PNG)

# Hardware

To assemble the probe you will need:

* 8 6mmx3mm neodymium magnets
* 2 m2x8mm socket head screws  
* 2 m3x16mm socket head screws
* 2 m3x6mm threaded inserts
* 2 m5x10 socket head screws
* 2 m5 t-nuts
* 2 m2x8mm socket head screws
* 2 m2 nuts

The threaded inserts get inserted into the probe dock base, everything else is pretty self-explanatory.

Please reference the Klicky repo for probe assembly instructions: https://github.com/jlas1/Klicky-Probe

# Software

The macros were written for RepRap firmware 3.4.5, previous versions may not work.

These macros are intended to be an example, and might need to be modified for your printer.

Create a folder in the `Macros` directory called `Docking`. Place `deployProbe`, `stowProbe`, and `DockEnv` into that folder.

Edit `DockEnv` to change the `onDock_x` and `onDock_y` to match your docks mounted location. It WILL need to be on the back wall with room to the negative X direction to work with out modification. If necessary you can flip the sign on the `sideDock_x` variable

add `M98 P"0:/macros/Docking/DockEnv"` to your `config.g`. This will load the variables that define where your dock is. While editing the `config.g` update your z probe config, I pluged my probe into `Z_PROBE_IN` so my config was `M558 P5 C"zprobe.in" H3 F300 T99999`. 

Edit your `homeall.g` AND your `homez.g` in your system folder to reflect the new z probe. My `homeall.g` calls `homez.g` and are provided as an example.

Restart your board for changes to take effect, and test out the macros. Should  `deployProbe` or `stowProbe` fail mechanically, there is logic to disable steppers and prevent any further movement. 

`repeatability test` runs 30 docks/undocks with a move in between to test repeatability of the probe. My installation gave a maximum deviation of 0.013 mm with a standard deviation of 0.003 mm .

