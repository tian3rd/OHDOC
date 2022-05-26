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
