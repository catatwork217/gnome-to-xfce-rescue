# GNOME-to-XFCE Linux Rescue & Rebuild Toolkit

🚑 Real Linux Rescue Toolkit • XFCE+UFW+ClamAV • 24.04 LTS

This repo contains real-world scripts and recovery steps to:
- Recover from GNOME session corruption or boot failure
- Fully purge GNOME and GDM
- Install and lock XFCE as the default desktop environment
- Harden your system with ClamAV, UFW, SMART, and more
- Set up post-install automation and dotfile consistency

Tested on Ubuntu 24.04 LTS and Framework16 laptop.

## Why I Created This

After losing my desktop environment and getting trapped in TTY loops, I rebuilt my Linux system from the ground up and documented every step. This toolkit turns chaos into clean XFCE-powered clarity.

## How to Use

### ✅ Option 1: Bootstrap Method (recommended for clean installs)

```bash
wget https://raw.githubusercontent.com/catatwork217/gnome-to-xfce-rescue/main/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh
```

### ✅ Option 2: Manual Use

Clone the repo and run `postinstall-finalize.sh` to apply system hardening, automation tools, and dotfile setup.
This is ideal if you've already purged GNOME or want to reapply the toolkit on an existing XFCE system.

```
git clone git@github.com:catatwork217/gnome-to-xfce-rescue.git
cd gnome-to-xfce-rescue
chmod +x postinstall-finalize.sh
./postinstall-finalize.sh
```

## Included Scripts

- `postinstall-finalize.sh`: repeatable system bootstrap for XFCE + tools
- `setup-archives/xfce_cleanup-2025-05-14.sh`: legacy GNOME purge script
- `.dotfiles.dmrc`: locks LightDM to XFCE session to prevent login loop


### ⭐️ Contributions Welcome

If you've survived a GNOME session meltdown or built your own XFCE-based fortress, feel free to fork, contribute, or share your own recovery workflows.
