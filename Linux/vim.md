## Practical Vim

> If confused, type $:help {cmd}$ to look it up.

**Trick 1 $.$ command**
$.$ reapeats last modification.
x: delete char under current cursor
u: undo
dd: delete whole line

\>G: increase the indentation from current line till end of file
^: to the first non-blank

**Trick 2 compound cmds**
A: $a
C: c$
s: cl //delete and enter insert mode
S: ^c == cc //delete line and enter insert mode
I: ^i
o: A<Enter>
O: ko

**Trick 3**
f{char}: look for char
;: repeat latest f, t. F, T //but it doesn't work for me (maybe sth wrong in my vimrc?)

**Trick 4**
@::
&:
:substitute:
REPEATABLES: ./u ;/, n/N &/u @x/u

**Trick 5 Search and replace**
:%s/{word1}/{word2}/g: globally search and replace
/{word}<Enter>: search the word
star: search forward for the next occurance
cw: change the word manually after checking
n.: repeat for next word

## Other commands

Q: How to set numbers in `vim` command line?
A: `:set number` [ref](https://linuxize.com/post/how-to-show-line-numbers-in-vim/)
