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
