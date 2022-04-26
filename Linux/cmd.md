## Real problems

1. How to output terminal messages to a file? [ref](https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file)

Just redirect the output (AKA `stdout`) to a file: `SomeCommand > SomeFile.txt `

Or if you want to append data: `SomeCommand >> SomeFile.txt`

If you want `stderr` as well use this: `SomeCommand &> SomeFile.txt `

or this to append: `SomeCommand &>> SomeFile.txt `

if you want to have both `stderr` and output displayed on the console and in a file use this: `SomeCommand 2>&1 | tee SomeFile.txt` (If you want the output only, drop the 2 above)

2. What does `2>&1` mean in bash? [ref](https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean)

2>1 may look like a good way to redirect stderr to stdout. However, it will actually be interpreted as "redirect stderr to a file named 1". & indicates that what follows and precedes is a file descriptor and not a filename. So the construct becomes: 2>&1.

Consider >& as redirect merger operator.

3. How to backup the sd card in Mac OS terminal? [ref](https://beebom.com/how-clone-raspberry-pi-sd-card-windows-linux-macos/)

Use `sudo dd if=/dev/disk2 of=/Users/hostname/backup.img` to backup the sd card to local disk. When you need to restore it to a new sd card, use `sudo dd if=/Users/hostname/backup.img of=/dev/disk2` (reversed process). Make sure to use `diskutil list` to find out the target disk, and use `diskutil unmountDisk /dev/disk2` to unmount the sd card before you start the backup process.

Additionally, if you just want to copy the micro sd card to a new sd card in rpi, just use the `sd card copier` tool in rpi under the accessories. Refer to https://linuxhint.com/how-to-clone-a-raspberry-pi-sd-card/ for more details.

4. How to change your hostname?[ref](https://www.tomshardware.com/how-to/raspberry-pi-change-hostname)

In rpi, the hostname is in `/etc/hostname` and `/etc/hosts`

5. How to measure hard disk performance (read/write speed) in Linux?

In command line, use `dd`. Refer to https://askubuntu.com/questions/87035/how-to-check-hard-disk-performance for more.
