## Ghost in the shell environment

Q: _How to set up static ip addresses in Linux and connect to other fixed static ip devices by wire_
A: Modify the file inside `/etc/network/interfaces.d/`.
For example, file `/etc/network/interfaces` has the following content:

```
source-directory /etc/network/interfaces.d
```

SO we need to create a file inside `/etc/network/interfaces.d/` with the following content:

```
# to access the device at 128.1.1.100
auto eth0:1
allow-hotplug eth0:1
iface eth0:1 inet static
    address 128.1.1.1
    netmask 255.255.255.0

# to access the device at 192.168.1.100
auto eth0:2
allow-hotplug eth0:2
iface eth0:2 inet static
    address 192.168.1.1
    netmask 255.255.255.0
```

Followup: _How to restart the network services_
Use `sudo service networking restart`

Q: _How to uninstall libreoffice_
A: refer to https://askubuntu.com/questions/180403/how-to-uninstall-libreoffice

```
sudo apt-get remove --purge libreoffice\*
sudo apt-get clean
sudo apt-get autoremove
```

Q: _What's the difference between adding `#!/usr/bin/env python` and `#!/usr/bin/python3`_
A: `#!/usr/bin/env python` uses the python environment variables of the current shell in the PATH environment, while `#!/usr/bin/python3` is a hard-coded python3 interpreter. The difference occurs when there're multiple python interpreters, or when the python interpreter is not in `/usr/bin/` in a virtual environment. Refer to https://stackoverflow.com/questions/5709616/whats-the-difference-between-python-shebangs-with-usr-bin-env-rather-than-hard for more details.

Q: How to install `tldr` for Linux?
A: To install [`tldr`](https://tldr.sh/), it's better to use `npm`, and to manage `npm`, it's better to use [`nvm`](https://www.freecodecamp.org/news/how-to-install-node-js-on-ubuntu-and-update-npm-to-the-latest-version/).

Q: How can I check if a directory exists in a Bash shell script?
A: `[ -d "${dir}" ]` [ref1](https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/) [ref2](https://stackoverflow.com/questions/59838/how-can-i-check-if-a-directory-exists-in-a-bash-shell-script)

Q: How to bind USB device under a static name?
A: [ref](https://unix.stackexchange.com/questions/66901/how-to-bind-usb-device-under-a-static-name)

Q: How to open multiple terminals without GUI?
A: Use `ctrl + F1-F12` [ref](https://raspberrypi.stackexchange.com/questions/7023/open-multiple-terminals-without-gui-startx)

Q: Add timestamps in `bash`.
A:

```bash
sudo vim ~/.bashrc
# in ~.bashrc file, add the following below HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%Y-%m-%d %T "
# restart bash
```

### Use Tmux

#### Get started with Tmux

https://linuxize.com/post/getting-started-with-tmux/

### Use Fish

https://fishshell.com/docs/current/index.html

Q: `fish` doesn't find `nvm`, `npm` while they are installed in `bash`.
A: First, install `fisher` plugin manager for `fish`. Then `fisher install FabioAntunes/fish-nvm edc/bass`.
