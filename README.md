# i3 config files

This repository contains my configuration files and scripts used for my [i3 Window Manager](https://i3wm.org/) setup.

## **Table of contents**:

* [Preview](#Preview)
* [Install](#Install)
  * [Instructions](#Instructions)
  * [Dependencies](#Dependencies)
* [How to use](#Manual)
* [Components](#Components)
  * ~/.config/i3
  * ~/.config/i3blocks
  * [Icons](#Icons)

## Preview:

<img src="https://raw.githubusercontent.com/Lawrence-Chiappelli/i3-config-files/main/myi3bar.png"/>

Bar position is top by default.

## Install

Installation is done manually until further notice.

### Instructions

Clone this repo: `$ git clone https://github.com/Lawrence-Chiappelli/i3-config-files.git`

Then:

1) Manually move `config` to `~/.config/i3/`
2) Manually move `*.sh` script files to `~/.config/i3blocks/`

Make directories if necessary.

Or:

Copy `.config` folder to `home/$USER`. Just make sure to back up your existing configuration files if you do this.

Note: You will have to edit `~/.config/i3/config` if you want to change the directory of my `*.sh ` scripts. I would also recommend editing that file and change the `$TERMINAL` variable to your terminal, if it's anything other than Alacritty.

### Dependencies

Ensure these dependencies are installed:

- [sysstat](https://archlinux.org/packages/community/x86_64/sysstat/) - for CPU usage
- [nvidia](https://archlinux.org/packages/extra/x86_64/nvidia/) - for GPU usage
- [i3lock-color-git](https://aur.archlinux.org/packages/i3lock-color-git/) - for an enhanced lock screen
- [Awesome Font](https://fontawesome.com/) - workspace icons rely on these
- [Flameshot](https://archlinux.org/packages/community/x86_64/flameshot/) - Screenshotting software
- [Thunar](https://archlinux.org/packages/extra/x86_64/thunar/) - For being opened by certain actions
- [Micro](https://archlinux.org/packages/community/x86_64/micro/) - for text editing opened by some scripts
- [dmenu](https://archlinux.org/packages/community/x86_64/dmenu/) - for 4 different dmenu's
  - a standard dmenu
  - a desktop files dmenu
  - a config files dmenu
  - a logout dmenu

## Manual

How to use:

All keybinds are inherited from i3's default keybindings, with the exception of these:

`alt` - the $mod key

---

`$mod+d` - open default dmenu

`$mod+Shift+d` - open desktop files dmenu

`$mod+Shift+ctrl+d` - open config files dmenu

---

`$mod+F2` - decrease master volume

`$mod+F3` - increase master volume

`$mod+F4` - toggle master volume

`$mod+Shift+F2` - decrease headphone volume

`$mod+Shift+F3` - increase headphone volume

`$mod+Shift+F4` - toggle headphone volume

This corresponds to my keyboard volume keys, assuming if used with FN.

---

Focus/move keys:

`j` for left

`i` for up

`k` for down

`l` for right

Combine with `Shift` where required.

---

`$mod+Tab` - split toggle

`Print` - `$ exec "sleep 0 && flameshot gui`

`Shift+Print` - `$ exec "sleep 1 && flameshot gui`

`Shift+ctrl+Print` - `$ exec "sleep 2 && flameshot gui`

The omission of `$mod` is intentional for some keys.

---

Some of my workspaces are hardcoded on specific monitors. See the below `config` snippet:

``` bash
# ws = workspace
# m = monitor

workspace $ws1 output $m1
workspace $ws2 output $m1
workspace $ws3 output $m1
# workspace $ws4 output $m1 (sometimes want on $m2)
workspace $ws5 output $m1
workspace $ws6 output $m2
workspace $ws7 output $m2
workspace $ws8 output $m2
workspace $ws9 output $m2
workspace $ws10 output $m2
```

## Components

### `~/.config/i3`

#### `/config`

Primary configuration file for i3.

`Alt` is the modifier key.

See [manual](#Manual) for more details.

### `~/.config/i3blocks`

I have left comments in these files that document my motivations for certain decisions. Assume my intent was experimentation. I was new to the bash language and was aiming to get a handle on things.

#### `/config`

The primary configuration file for i3blocks.

Otherwise, in alphabetical order:

#### `/audio.sh`

See volume section in the [manual](#Manual).

Mainly controls master and headphone volume. Relies on alsamixer.

#### `/brightness.sh`

Increases/decreases the brightness of all of your monitors by clicking the yellow up/down arrow icons. Relies on `xrandr`.

Brightness values are strictly limited between 100% and 10%, meaning you cannot go over or under those thresholds.

#### `/cpu.sh`

Displays CPU load as a whole percentage. Typically, others choose to display 1 or 2 additional decimal places. I prefer compactness of omitting decimal places, but it's easy enough to adjust this if you prefer different decimal formats.

#### `/gpu.sh`

Only displays GPU load as a whole percentage. This script contains unused GPU  parameters (such as fan speed, temperature, etc) to provide the means of easily expanding on informational output. It does, however, assuming you're running an Nvidia GPU by using `nvidia-smi`. This will likely return 0% if you are using an integrated GPU or missing drivers.

#### `/ram.sh`

Displays `used RAM in G / available RAM in G`. The text color becomes progressively "green-er" the more RAM you use (i.e., "unused RAM is wasted RAM"). I find this useful to benchmark my system's capacity as I continue to open programs and increase system load, therefore providing the confidence to safely utilize the system's full potential.

#### `/ssid.sh`

A script originally planned to display the name of the SSID I am connected to. However, my alternative idea is simple: if you can ping aur.archlinux.org, you are connected to the internet. Successful connection to the internet is colored in green. Unsuccessful connection is colored red.

One caveat is that this script assumes you'll be connected via USB tethering. The for reason for this is that my wifi adapter lacked driver support at the time. 

If you have USB tethering enabled, but have no internet access, it will simply indicate so with the text "USB tethering". This means it recongizes you have USB tethering enabled, but you'll have to take some further action to connect to the internet. Hint: check your device's MAC address with `$ ip addr`.


### Icons

The following details the clickable, interactive icons not tied to any scripts:

#### Yellow up/down arrows

Click to increase/decreases brightness, respectively.

```bash
[brightness]
command=bash $BLOCK_NAME.sh 'increase'
# and:
[brightness.sh]
command=bash $BLOCK_NAME 'decrease'
```

#### Folder

Click to open the `thunar` file manager.

```bash
[fileexplorer]
command=thunar
```

#### Camera

Click to open the `flameshot` screenshotting software.

More specifically, it's the equivalent of typing `$flameshot gui` in terminal. See official [repository](https://github.com/flameshot-org/flameshot) for more details about this decision.

```bash
[screenshot]
command=flameshot gui
```

#### Red arrow

Click to confirm to log out. It's the equivalent of pressing `mod+Shift+e`- that being the default keybind to logout if using i3.

```bash
[logout.sh]
interval=0
# Command is automatic via block name
```

#### Green power button

Inactive/commented out until further notice.

Shuts down the computer immediately. There is no confirmation message. It's the equivalent of entering `$shutdown now` in terminal.
