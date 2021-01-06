# i3 config files

This repository contains custom configuration files and scripts used to customize the behavior of my [i3 Window Manager](https://i3wm.org/) setup. Feel free to use any of these for your setup.

## Preview:

<img src="https://raw.githubusercontent.com/Lawrence-Chiappelli/i3-config-files/main/myi3bar.png"/>

## **Table of contents**:

* [Considerations](#Considerations)
* [Component rundown]
  * [config](#config)
  * [i3blocks.conf](#i3blocks.conf)
  * [scripts](#scripts)

## Considerations

Some components may rely on certain dependencies you may not have on your system. I have written comments in the necessary scripts indicating usage of those dependencies.

Additionally, I use [Awesome Font](https://fontawesome.com/) for most of my output, so you may want to install that font file on your system if you don't already have it.

## Component rundown

The root of my i3 configuration contains the following following files as follows:

### config

Contains my custom keybinds and workspace configuration specific to my workflow. It uses `alt` as the modifier key.

### i3blocks.conf

The general configuration file for "blocks". I have left documention in the form of comments that detail my motivations for certain decisions. I would recommend viewing non-script dependent blocks on a case-by-case basis.

The following briefly detail the interactive icons not tied to any scripts:

##### Folder

Opens the `thunar` file manager.

##### Camera

Opens the `flameshot` screenshotting software.

(More specifically, it's the equivalent of typing `$flameshot gui` in terminal. See official [repository](https://github.com/flameshot-org/flameshot).)

##### Red X

Logs out the user. It's the equivalent of pressing `mod+Shift+e`- that being the default keybind to logout if using i3.

##### Green power button

Shuts down the computer immediately. There is no confirmation message. It's the equivalent of entering `$shutdown now` in terminal.

### scripts (directory)

If you browse through the source code, you may notice it contains different ways of accomplishing any one task. This is the result of utilizing open-source templates and me experimenting with the bash language.

In alphabetical order, this directory contains the following files:

##### audio.sh

Click to toggle volume level between 100% and 0%. Relies on `alsamixer`.

On each system boot, this script is hardcoded to output the current volume level at 47%, which appears to be the default starting percentage for alsamixer. This may vary between systems.

##### brightness-decrease.sh

Decreases the brightness of your primary monitor by clicking the yellow down arrow. Relies on `xrandr` to do so. It interacts with a generic `VAR-BRIGHTNESS` file to keep track of the current brightness level.

##### brightness-increase.sh

Increases the brightness of your primary monitor by clicking the yellow up arrow. Relies on `xrandr` to do so. It interacts with a generic `VAR-BRIGHTNESS` file to keep track of the current brightness level.

##### cpu.sh

Displays CPU load as a whole percentage. Typically, I have found that others display 1 or 2 additional decimal places. I personally like the compactness of omitting decimal places, but it should be easy enough to adjust this if you prefer the decimal format.

##### gpu.sh

Only displays GPU load as a whole percentage. This script contains unused GPU  parameters (such as fan speed, temperature, etc) to provide the means of easily expanding on informational output. It does, however, assuming you're running an Nvidia GPU by using `nvidia-smi`. This will likely return 0% if you are using an integrated GPU or missing drivers.

##### ram.sh

Displays `used RAM in G / available RAM in G`. The text color becomes progressively "green-er" the more RAM you use (i.e., "unused RAM is wasted RAM"). I find this useful to benchmark my system's capacity as I continue to open programs and increase system load, therefore providing the confidence to safely utilize the system's full potential.

##### ssid.sh

A script originally planned to display the name of the SSID I am connected to. However, my alternative idea is simple: if you can ping aur.archlinux.org, you are connected to the internet. Successful connection to the internet is colored in green. Unsuccessful connection is colored red.

One caveat to mention is that it assumes you'll be connected via USB tethering (at the time, my wifi adapter lacked driver support). If you have USB tethering enabled, but have no internet access, it will simply indicate so with the text "USB tethering". This means it recongizes you have USB tethering enabled, but you'll have to take some further action to connect to the internet.

##### VAR-BRIGHTNESS

A generic file used to keep track of the current brightness level, used by `brightness-decrease.sh` and `brightness-decrease.sh`.
