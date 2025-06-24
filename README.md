# Ubuntu ULTIMATE Setup Script

A comprehensive, automated setup script for Ubuntu-based Single Board Computers (SBCs) like Raspberry Pi, Orange Pi, and other headless systems.

## 🚀 Quick Start

```bash
# Download the script
wget https://raw.githubusercontent.com/yourusername/ubuntu-sbc-setup/main/setup.sh

# Make it executable
chmod +x setup.sh

# Run the setup
./setup.sh
```

## 📋 What This Script Does

### System Packages Installed
- **Core utilities**: `git`, `curl`, `wget`, `vim`, `htop`, `tree`, `unzip`
- **Network tools**: `net-tools`, `bridge-utils`, `nmap`, `openssh-server`
- **Development**: `build-essential`, `python3`, `python3-pip`, `python3-dev`
- **System monitoring**: `iotop`, `lsof`, `ufw` (firewall)
- **SBC-specific**: `i2c-tools`, `python3-smbus` for hardware interfacing
- **Terminal multiplexers**: `tmux`, `screen`
- **File operations**: `rsync`

### Python Packages Installed
- **Web frameworks**: Flask, FastAPI, Uvicorn
- **HTTP clients**: requests, httpx, aiohttp, websockets
- **Database**: SQLAlchemy, PyMongo, Redis client
- **IoT & Hardware**: RPi.GPIO, gpiozero, pyserial, paho-mqtt
- **Sensors**: w1thermsensor, Adafruit CircuitPython libraries
- **Bluetooth**: bleak (Bluetooth Low Energy)
- **Security**: cryptography, bcrypt, PyJWT
- **Utilities**: python-dotenv, PyYAML, psutil, schedule
- **Development**: pytest, black, flake8, virtualenv

## 🎯 Designed For

- **Raspberry Pi** (all models)
- **Orange Pi** 
- **Rock Pi**
- **Jetson Nano**
- **Other ARM/x64 SBCs** running Ubuntu

## ✨ Features

- **Fully automated** - No user input required during installation
- **Error handling** - Continues installation even if individual packages fail
- **Headless optimized** - No GUI packages or heavy dependencies
- **IoT ready** - Includes MQTT, GPIO, and sensor libraries
- **Development friendly** - Essential tools for Python development
- **Security focused** - Includes firewall and security packages

## 🔧 Customization

### Adding Packages

Edit the arrays in the script to add your own packages:

```bash
# Add system packages
PACKAGES=(
    "existing-package"
    "your-new-package"
)

# Add Python packages
PIP_PACKAGES=(
    "existing-python-package"
    "your-new-python-package"
)
```

### Optional Git Configuration

Uncomment and modify these lines in the script:

```bash
# Configure git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Optional SSH Key Generation

Uncomment this section if you need SSH keys:

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com" -f ~/.ssh/id_ed25519 -N ""
```

## 📊 Installation Time

Typical installation times on different SBCs:

- **Raspberry Pi 4**: ~15-20 minutes
- **Raspberry Pi 3**: ~25-30 minutes  
- **Orange Pi**: ~20-25 minutes
- **Rock Pi**: ~15-20 minutes

*Times vary based on internet speed and SD card performance*

## 🛠️ Troubleshooting

### Permission Issues
If you get permission errors, ensure you have sudo access:
```bash
sudo -v
```

### Package Installation Failures
The script continues even if individual packages fail. Check the output for any "Failed to install" messages.

### GPIO Libraries on Non-Pi Systems
RPi.GPIO will fail on non-Raspberry Pi systems. This is expected and won't break the installation.

### Network Issues
If downloads fail, check your internet connection and DNS settings:
```bash
ping 8.8.8.8
nslookup google.com
```

## 🔐 Security Notes

- The script installs `ufw` (Uncomplicated Firewall) but doesn't enable it
- SSH server is installed but uses default configuration
- Consider changing default passwords and SSH keys after setup

## 📝 Post-Installation Tasks

After running the script, you may want to:

1. **Configure firewall**:
   ```bash
   sudo ufw enable
   sudo ufw allow ssh
   ```

2. **Set up Git**:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your@email.com"
   ```

3. **Generate SSH keys**:
   ```bash
   ssh-keygen -t ed25519 -C "your@email.com"
   ```

4. **Create Python virtual environment**:
   ```bash
   python3 -m venv ~/venv
   source ~/venv/bin/activate
   ```

5. **Configure static IP** (if needed for your SBC)

## 🤝 Contributing

Feel free to submit issues and enhancement requests! Common improvements:

- Additional SBC-specific packages
- More IoT protocols and libraries  
- Development tools for specific use cases
- Performance optimizations

## 📄 License

This script is provided as-is under the MIT License. Use at your own risk.

## 🔗 Related Projects

- [Raspberry Pi Imager](https://github.com/raspberrypi/rpi-imager) - For flashing OS images
- [Ansible Playbooks](https://docs.ansible.com/) - For more complex multi-system deployments
- [Docker](https://www.docker.com/) - For containerized applications on SBCs

---

**Happy coding on your SBC! 🎉**
