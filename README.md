# My Hyprland Rice

## Description

This is my config for Hyprland with Waybar and other programs that make my setup work and look good. If you would like to use this setup, use at your own risk.

## Warning
Use at your own risk. Consider backing up your config files first.

## Instructions

### Step 1: Clone This Repo

Clone this repo, then `cd` into it. Feel free to place this rice anywhere on your computer.

```
git clone https://github.com/joshua-holmes/hyprland-rice.git && cd hyprland-rice
```

### Step 2: Create a Hyprland Wrapper

Normally, to execute Hyprland you (or your display manager) would execute the `Hyprland` command to start Hyprland.

However, there are several environment variables that need to be set in order to have a smooth experience. That's where having a wrapper comes in.

What the wrapper does is simple: It sets the necessary environment variables, then executes `Hyprland`. That way, you (or your display manager) can execute the wrapper instead of `Hyprland` directly.

I have written a wrapper for this rice that works well for me. To apply it to your system, run:
```
sudo cp ./bin/hyland-wrapped /usr/bin/.
```

Then execute `hyprland-wrapped` instead of `Hyprland` when you want to run Hyprland.

### Step 3: Setup Config Files

The config step has 2 options. Both will produce the same results:

#### Replacement Option (recommended)

This is the recommended and most basic setup. With this setup, simply replace the config folder found in `~/.config/<some-program>` with what is found in this repo `./config/<some-program>`. Do this for each config folder found here in this repo: `./config/`.

#### Symbolic Link Setup

This setup in not recommended because it is a bit more advanced and only useful in niche scenarios.

With this setup, you will replace the config folders in your `~/.config/` directory with symbolic links of what is in this repo. This is useful if you want the same setup across multiple users. I have a special script in this repo for applying all of my config folders at once in this way. I would recommend finding a permanent place to keep this folder. I chose `/usr/global/`, which doesn't currently exist on my computer. So for me, it would look like this:

*WARNING running this command will create a symbolic link to each config directory from this repo in `./config/` and REPLACE any folders you have in `~/.config/` with it.*
```
./config/apply-all.sh
```

Or you can `git clone` your folder somewhere and link a single folder like so (this example is for setting up the `hypr` config):

```
rm -fr ~/.config/hypr/ && ln -s <your chosen directory>/config/hypr/ ~/.config/.
```

