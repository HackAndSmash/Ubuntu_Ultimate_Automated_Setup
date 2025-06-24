#!/bin/bash

# Ubuntu System Setup Script
# Run with: bash setup.sh

set -e  # Exit on any error

echo "🚀🚀🚀Starting Ubuntu system setup🚀🚀🚀"

# Update package lists
echo "Updating package lists..."
sudo apt update

# Upgrade existing packages
echo "Upgrading existing packages..."
sudo apt upgrade -y

# Define packages to install
PACKAGES=(
    "net-tools"
    "git"
    "openssh-server"
    "tmux"
    "python3"
    "python3-pip"
    "bridge-utils"
    "curl"
    "wget"
    "vim"
    "htop"
    "tree"
    "unzip"
    "build-essential"
    "i2c-tools"
    "python3-dev"
    "python3-smbus"
    "screen"
    "rsync"
    "nmap"
    "iotop"
    "lsof"
    "ufw"
	"tshark"
)

# Install packages
echo "Installing packages..."
for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo apt install -y "$package"
done

# Python packages to install via pip3 (headless/SBC optimized)
PIP_PACKAGES=(
    # Core essentials
    "requests"
    "urllib3"
    "websockets"
    "aiohttp"
    "httpx"
    
    # Lightweight web frameworks
    "flask"
    "fastapi"
    "uvicorn"
    
    # Database and data handling
    "sqlalchemy"
    "pymongo"
    "redis"
    "psycopg2-binary"
    
    # API and networking
    "pydantic"
    "jsonschema"
    "paramiko"
    "fabric"
    
    # Async and I/O
    "aiofiles"
    "asyncio"
    
    # System utilities
    "python-dotenv"
    "pyyaml"
    "toml"
    "configparser"
    "python-dateutil"
    "pytz"
    
    # Lightweight development tools
    "pytest"
    "black"
    "flake8"
    "virtualenv"
    
    # IoT and hardware (common for SBCs)
    "pyserial" 
    "RPi.GPIO"
    "gpiozero"
    "adafruit-circuitpython-motor"
    "adafruit-circuitpython-servo"
    "w1thermsensor"
    
    # MQTT and IoT protocols
    "paho-mqtt"
    "bleak"  # Bluetooth Low Energy
    
    # Cryptography and security
    "cryptography"
    "bcrypt"
    "pyjwt"
    
    # Lightweight CLI tools
    "click"
    "tqdm"
    "rich"
    
    # Cloud services (lightweight)
    "boto3"
    
    # Monitoring and logging
    "psutil"
    "schedule"
)

# Install Python packages
echo "Installing Python packages with pip3..."
echo "This may take several minutes..."

# Upgrade pip first
python3 -m pip install --upgrade pip

# Install packages in batches to handle potential conflicts
for package in "${PIP_PACKAGES[@]}"; do
    echo "Installing Python package: $package"
    python3 -m pip install "$package" || echo "FAILED to install $package, continuing..."
done

# Optional: Install snap packages
SNAP_PACKAGES=(
    # "code"
    # "discord"
    # "firefox"
)

if [ ${#SNAP_PACKAGES[@]} -gt 0 ]; then
    echo "Installing snap packages..."
    for snap_package in "${SNAP_PACKAGES[@]}"; do
        echo "Installing $snap_package..."
        sudo snap install "$snap_package"
    done
fi

# Clean up
echo "🧹 Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean

# Optional: Configure git (uncomment and modify as needed)
# echo "Configuring git..."
# git config --global user.name "Your Name"
# git config --global user.email "your.email@example.com"

# Optional: Generate SSH key (uncomment if needed)
# echo "Generating SSH key..."
# ssh-keygen -t ed25519 -C "your.email@example.com" -f ~/.ssh/id_ed25519 -N ""

echo "Setup complete! You may want to reboot your system."
echo "Remember to:"
echo "   - Configure git with your name and email"
echo "   - Generate SSH keys if needed"
echo "   - Configure any additional services"