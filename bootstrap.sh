#!/bin/bash

echo "🚀 Starting GNOME-to-XFCE Rescue Bootstrap"

# 1. Set working directory
WORKDIR=~/Projects/gnome-to-xfce-rescue
mkdir -p "$WORKDIR"
cd "$WORKDIR" || exit 1

# 2. Install Git if it's not already installed
if ! command -v git &> /dev/null; then
    echo "🛠 Installing Git..."
    sudo apt update && sudo apt install git -y
fi

# 3. Clone your GitHub repo if it doesn't exist
if [ ! -d "$WORKDIR/.git" ]; then
    echo "📦 Cloning your toolkit repo..."
    git clone git@github.com:catatwork217/gnome-to-xfce-rescue.git "$WORKDIR"
else
    echo "🔄 Repo already cloned. Pulling latest updates..."
    git pull
fi

# 4. Ensure XFCE session is locked in
echo "🔒 Setting session to XFCE in .dmrc"
echo -e "[Desktop]\nSession=xfce" > ~/.dmrc
chmod 644 ~/.dmrc

# 5. Run the postinstall-finalize.sh script
if [ -f "$WORKDIR/postinstall-finalize.sh" ]; then
    echo "⚙️ Running postinstall-finalize.sh..."
    chmod +x "$WORKDIR/postinstall-finalize.sh"
    "$WORKDIR/postinstall-finalize.sh"
else
    echo "❌ postinstall-finalize.sh not found in repo!"
    exit 1
fi

echo "✅ Bootstrap complete. XFCE rescue toolkit installed and running!"
