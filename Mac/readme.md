## Mac Tips

List the system information:

```bash
system_profiler SPSoftwareDataType SPHardwareDataType
# use system_profiler -listDataTypes to list all the data types
```

### Hardware

### Software

Q: How to add a static route to macOS?
A: `sudo route -n add -net <network> -interface <interface>` [ref](https://superuser.com/questions/756134/how-to-direct-ip-route-through-specific-interface-in-os-x?utm_source=pocket_mylist)
