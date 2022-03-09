## Real problems

1. How to output terminal messages to a file? [ref](https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file)

Just redirect the output (AKA `stdout`) to a file: `SomeCommand > SomeFile.txt `

Or if you want to append data: `SomeCommand >> SomeFile.txt`

If you want `stderr` as well use this: `SomeCommand &> SomeFile.txt `

or this to append: `SomeCommand &>> SomeFile.txt `

if you want to have both `stderr` and output displayed on the console and in a file use this: `SomeCommand 2>&1 | tee SomeFile.txt` (If you want the output only, drop the 2 above)
