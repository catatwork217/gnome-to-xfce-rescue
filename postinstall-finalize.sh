#!/bin/bash
echo ">>> Starting Final System Setup [$(date '+%Y-%m-%d %H:%M:%S')]"

# ✅ Enable and configure UFW Firewall
echo ">>> Enabling UFW Firewall"
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# ⚙️ Install system health + monitoring tools
echo ">>> Installing System Health Tools"
sudo apt install -y htop ncdu lm-sensors smartmontools neofetch
sudo sensors-detect --auto

# 🔄 Backup drive mount setup is deferred
# echo ">>> Creating mount point for external drive"
# sudo mkdir -p /mnt/backup
# echo ">>> Example entry for /etc/fstab:"
# echo "# UUID=xxxx-xxxx /mnt/backup auto nosuid,nodev,nofail,x-gvfs-show 0 0"

# 🎛 Final tweaks
echo ">>> Adding Neofetch to shell login"
echo "neofetch" >> ~/.bashrc

echo ">>> Enabling Smartmontools for disk health checks"
sudo systemctl enable smartd
sudo systemctl start smartd

# 🛡️ Install and configure ClamAV
echo ">>> Installing ClamAV and GUI frontend"
sudo apt install -y clamav clamav-daemon clamtk

echo ">>> Updating ClamAV virus definitions"
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

echo ">>> Creating weekly scan job"
echo "clamscan -r /home/$USER --bell -i --log=$HOME/clamav-weekly.log" | sudo tee /etc/cron.weekly/clamav-scan
sudo chmod +x /etc/cron.weekly/clamav-scan

echo ">>> Finalizing setup - done! Safe to reboot."
