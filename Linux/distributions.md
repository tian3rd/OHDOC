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
