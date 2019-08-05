#!/bin/bash
echo " _     ____  ____  ______________  ____  _    _________  ____  ____  _____  _     ____  _  ____ "
echo "/ \  //  _ \/  _ \/    /  __/  _ \/  __\/ \  /  __/ ___\/ ___\/ ___\/__ __\/ \ /\/  _ \/ \/  _ \"
echo "| |\ || / \|| / \||  __\  \ | / \||  \/|| |  |  \ |    \|    \|    \  / \  | | ||| | \|| || / \|"
echo "| | \|| \_/|| \_/|| |  |  /_| |-|||    /| |_/\  /_\___ |\___ |\___ |  | |  | \_/|| |_/|| || \_/|"
echo "\_/  \\____/\____/\_/  \____\_/ \|\_/\_\\____|____\____/\____/\____/  \_/  \____/\____/\_/\____/"

echo "=============================================="
echo "======= Starting Install Kali Linux =========="
echo "=============================================="

# Update
apt-get update && apt-get upgrade -y
echo "---------------------------------- Update Finished ------------------------------------"

echo "=============================================="
echo "========== Starting Install Tools ============"
echo "=============================================="
# List kali tools packages(choise your need just incoment before 'apt')
#apt install kali-linux-full #use this if u want
#apt install kali-linux-all #use this if u want
#apt install kali-linux-nethunter #use this if u want


# Default includes tools for small storage
apt install aircrack-ng apache2 armitage backdoor-factory beef-xss burpsuite exploitdb metasploit-framework mitmf nethunter-utils nmap \
openssh php postgresql python-lxml python-m2crypto python-mako python-netaddr python-pcapy python-pip python3-pip python-setuptools \
python-twisted sqlmap tcpdump tcptrace tinyproxy tshark wireshark hydra maltego maltego-teeth zaproxy zip git python3-pip net-tools traceroute iputils-ping apt-transport-https \
gdisk gnome-terminal php php-mysql nano vim rfkill screen sudo testdisk locate -y
echo "---------------------------------- Tools Installed ------------------------------------"
echo "=============================================="
echo "======= Starting Install Kali Desktop ========"
echo "=============================================="
# Install xfce
sudo apt install xfce4 xfce4-places-plugin xfce4-goodies -y

# Install Desktop
apt install kali-defaults desktop-base kali-root-login kali-desktop-xfce xrdp xorg tightvncserver -y

echo "---------------------------------- Desktop Installed ------------------------------------"

echo "=============================================="
echo "========== Starting Setup Desktop ============"
echo "=============================================="

# Modify VNC
mv ~/.vnc/xstartup ~/.vnc/xstartup.backup
touch ~/.vnc/xstartup
echo "#!/bin/bash" | sudo tee -a ~/.vnc/xstartup
echo "xrdb $HOME/.Xresources" | sudo tee -a ~/.vnc/xstartup
echo "startxfce4 &" | sudo tee -a ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup
echo "---------------------------------- Setup Finished ------------------------------------"

echo "=============================================="
echo "=========== Starting VNC Server =============="
echo "=============================================="
# Run VNC
vncserver
echo "--------------------------------------------------------------------------------------"
echo "----------------------------------- Done ---------------------------------------------"
echo "--------------------------------------------------------------------------------------"

