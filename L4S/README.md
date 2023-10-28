# Setting Up L4S on Routers
The following can also be added to the (router startup scripts)[../CloudLab/router1.sh] before updating and instatiating the profile on CloudLab.
```bash
# Implement L4S. source: https://github.com/L4STeam/linux
wget https://github.com/L4STeam/linux/releases/download/testing-build/l4s-testing.zip
unzip l4s-testing.zip
sudo dpkg --install debian_build/*
sudo update-grub  # This should auto-detect the new kernel

# Manually reboot then confirm correct kernel is used
sudo reboot
uname -r

# Confirm the required modules are loaded before doing experiments, e.g.,
sudo modprobe sch_dualpi2
sudo modprobe tcp_prague
```
