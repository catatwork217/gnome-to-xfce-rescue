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

## Included Scripts

- `postinstall-finalize.sh`: repeatable system bootstrap for XFCE + tools
- `setup-archives/xfce_cleanup-2025-05-14.sh`: legacy GNOME purge script
- `.dotfiles.dmrc`: locks LightDM to XFCE session to prevent login loop

## How to Use

Clone the repo and run `postinstall-finalize.sh` to apply system hardening, automation tools, and post-install XFCE configs. Intended for systems that have already had GNOME purged.

You can reuse the `.dmrc` config and scripts to bootstrap any new Linux machine into a hardened, clean XFCE workstation.

### ⭐️ Contributions Welcome

If you've survived a GNOME session meltdown or built your own XFCE-based fortress, feel free to fork, contribute, or share your own recovery workflows.
