## Distros

### Debian 11 Bullseye

Q: How to install debian with manual paritions?
A: Refer to this [pdf guide](../assets/pdf/Debian%2010%20Manual%20Partition%20for%20_boot,%20_swap,%20root,%20_home,%20_tmp,%20_srv,%20_var,%20_var_mail,%20_var_log%20–%20Tech%20Encyclopedia.pdf): https://techencyclopedia.wordpress.com/2020/04/21/debian-10-manual-partition-for-boot-swap-root-home-tmp-srv-var-var-mail-var-log/

Q: How to customize the source list for `apt` and `apt-get`?
A: https://wiki.debian.org/SourcesList

Q: 'username' is not in the sudoers file. This incident will be reported. How to add the user to the sudoer?
A: Use `su` to modify the `/etc/sudoers` file. (ctrl + D to exit `su`)

```
sudo su
# vi /etc/sudoers

# add your user name after the root
root     ALL=(ALL:ALL) ALL
yourusername    ALL=(ALL:ALL) ALL
```

Q: How to customize the service?
A: https://wiki.debian.org/systemd/Services
More: https://www.digitalocean.com/community/tutorials/how-to-configure-a-linux-service-to-start-automatically-after-a-crash-or-reboot-part-1-practical-examples

Q: How to properly shut down the system?
A: To shut down a running Debian GNU/Linux system, you must not reboot with the reset switch on the front or back of your computer, or just turn off the computer. Debian GNU/Linux should be shut down in a controlled manner, otherwise files might get lost and/or disk damage might occur. If you run a desktop environment, there is usually an option to “log out” available from the application menu that allows you to shutdown (or reboot) the system.

Alternatively you can press the key combination Ctrl+Alt+Del . A last option is to log in as root and type one of the commands poweroff, halt or shutdown -h now if either of the key combinations do not work or you prefer to type commands; use reboot to reboot the system. [ref](https://www.debian.org/releases/jessie/amd64/ch08s01.html.en)

### Raspberry Pi OS

Q: How to list Raspberry Pi Hardware Information?
A: Refer to https://linuxhint.com/commands-for-hardware-information-raspberry-pi/ and https://opensource.com/article/19/9/linux-commands-hardware-information

```bash
cat /proc/cpuinfo
cat /proc/meminfo
inxi -Fxz
hwinfo --short
lshw -short
```

Q: How to install `fish` shell in Raspberry Pi?
A: https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A3&package=fish

Q: How to remap the `capslock` key to `escape` key?
A: Refer to [https://raspberrypi.stackexchange.com/questions/5333/how-to-map-caps-lock-key-to-something-useful]

```bash
$ cat /etc/os-release
# Raspbian GNU/Linux 10 (buster)
sudo vim ~/.config/lxkeymap.cfg
# add "option caps:escape"
sudo reboot
```

Q: How to show the startup logs?
A: `sudo journalctl -k` or `sudo journalctl --boot` or `dmesg`
[ref1](https://forums.raspberrypi.com/viewtopic.php?t=124235) [ref2](https://raspberrypi.stackexchange.com/questions/949/running-headless-checking-boot-screen-messages)

Q: How to read the mail when prompted `You have new mail` in the terminal?
A: `sudo less /var/mail/$(whoami)` [ref](https://devanswers.co/you-have-mail-how-to-read-mail-in-ubuntu/)

Q: How to switch between users in terminal?
A: `sudo su -` or `sudo su - <username>`

Q:

```bash
sudo apt-get update
# E: Repository 'http://raspbian.raspberrypi.org/raspbian buster InRelease' changed its 'Suite' value from 'testing' to 'stable'
# N: This must be accepted explicitly before updates for this repository can be applied. See apt-secure(8) manpage for details.
```

A: `sudo apt update --allow-releaseinfo-change` or `sudo apt-get update --allow-releaseinfo-change` [ref](https://forums.raspberrypi.com/viewtopic.php?t=245073)

Q: No `pip3` installed on Raspberry Pi, how to install it??
A: `sudo apt-get install python3-pip` [ref](https://stackoverflow.com/questions/53195375/raspberry-doesnt-find-pip3)

Q: How to open another terminal without GUI?
A: `alt + F1-F12` [ref](https://raspberrypi.stackexchange.com/questions/7023/open-multiple-terminals-without-gui-startx)

Q: How to preserve environment variables when using `sudo`?
A: `sudo -E <command>` [ref](https://stackoverflow.com/questions/8633461/how-to-keep-environment-variables-when-using-sudo)

Q: How to find out if an environment variable has been set using python?
A:
[ref](https://stackoverflow.com/questions/3042304/how-to-determine-what-user-and-group-a-python-script-is-running-as)

```python
import os
if os.environ.get('VARIABLE_NAME') is not None:
    print('Variable is set')

import getpass
if getpass.getuser() == 'root':
    print('You are root')
```

Q: How to properly set up the static ip for Raspberry Pi?
A: Edit `/etc/dhcpcd.conf` and restart. [ref1](https://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip-address-on-raspbian-raspberry-pi-os/37921#37921) [ref2](https://www.makeuseof.com/raspberry-pi-set-static-ip/)
