# My Hyprland Rice

## Description

This is my config for Hyprland with Waybar and other programs that make my setup work and look good. If you would like to use this setup, use at your own risk.

## Replacement Setup

With this setup, you will simply replace the config folders in your `~/.config/` directory with the ones in this repo. It would look something like this in one command:

WARNING running this command will REPLACE any folders you have in `~/.config/` with what is found in this repo.
```
git clone https://github.com/joshua-holmes/hyprland-rice.git && cp -r ./hyprland-rice/config/* ~/.config/.
```

You can also copy one folder at a time, if you prefer.

## Symbolic Link Setup

With this setup, you will replace the config folders in your `~/.config/` directory with symbolic links of what is in this repo. This is useful if you want the same setup across multiple users. I have a special script in this repo for applying all of my config folders at once in this way. I would recommend finding a permanent place to keep this folder. I chose `/usr/global/`, which doesn't currently exist on my computer. So for me, it would look like this:

WARNING AGAIN running this command will REPLACE any folder you have in `~/.config/` with a symbolic of what is found in this repo.
```
mkdir /usr/global && git clone https://github.com/joshua-holmes/hyprland-rice.git /usr/global/. && /usr/global/config/apply-all.sh
```

Or you can `git clone` your folder somewhere and link a single folder like so (this example is for setting up the `hypr` config):

```
rm -fr ~/.config/hypr/ && ln -s <your chosen directory>/config/hypr/ ~/.config/.
```

## Warning

Again, use at your own risk. Consider backing up your config files first.
