> [Data Wrangling - Missing Semester](https://missing-semester-cn.github.io/2020/data-wrangling/)

## Homework

1. Take this [shor interactive regex tutorial](https://regexone.com)

Lesson Notes

- abc… Letters
- 123… Digits
- \d Any Digit
- \D Any Non-digit character
- . Any Character
- \\. Period
- [abc] Only a, b, or c
- [^abc] Not a, b, nor c
- [a-z] Characters a to z
- [0-9] Numbers 0 to 9
- \w Any Alphanumeric character
- \W Any Non-alphanumeric character
- {m} m Repetitions
- {m,n} m to n Repetitions
- \_ Zero or more repetitions + One or more repetitions
- ? Optional character
- \s Any Whitespace
- \S Any Non-whitespace character
- ^…$ Starts and ends
- (…) Capture Group
- (a(bc)) Capture Sub-group
- (.\_) Capture all
- (abc|def) Matches abc or def

> Exercise 1½: Matching digits
> Task Text
> match abc123xyz
> match define "123"
> match var g = 123;
> Note: pattern matches _anywhere_ within the string, not just starting at the first character

2. Find the number of words (in `/usr/share/dict/words`) that contain at least three `a`s and don’t have a `'s` ending. What are the three most common last two letters of those words? `sed`’s `y` command, or the `tr` program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

- Contains at lease three `a`s and not ends with `'s`

```terminal
cat /usr/share/dict/words | tr "[:upper:]" "[:lower:]" | grep -E '.*a.*a.*a.*'  | grep -v "'s\$" | wc -w
```

`tr "[:upper:]" "[:lower:]"` translates the contents to lowercase
`grep -E`: `grep` extended regexp
`grep -v`: invert match
`grep -v "'s\$`: in `fish`, you have to escape `$`, otherwise no need
Regexp can have multiple forms: `^([^a]*a){3}.*` is also valid

- Three most common last two letters

```terminal
cat /usr/share/dict/words | tr "[:upper:]" "[:lower:]" | grep -E '.*a.*a.*a.*'  | grep -v "'s\$" | sed -E 's/.*([a-z]{2}\$)/\1/' | sort | uniq -c | sort | tail -n3
```

Note: 1. use `()` and `\1` to select needed group; 2. sort before using `uniq` because `uniq` only checks adjacent lines.

- How many of the two-letter combinations are there?

```terminal
cat /usr/share/dict/words | tr "[:upper:]" "[:lower:]" | grep -E '.*a.*a.*a.*'  | grep -v "'s\$" | sed -E 's/.*([a-z]{2}$)/\1/' | sort | uniq -c | sort | wc -l
```

- Challenge: which combinations never occur?

## Extra
