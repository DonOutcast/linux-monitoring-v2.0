# Bash scripts, part 7: the awk data processing language

The awk utility, or more precisely GNU awk, in comparison to sed, takes the handling of data streams to a higher level. Thanks to awk, we have a programming language at our disposal instead of the rather small set of commands given to the editor. With the awk programming language, you can perform the following actions:
- Declare variables to store data.
- Use arithmetic and string operators to manipulate data.
- Use structural elements and language control structures, such as if-then operators and loops to implement complex data processing algorithms.
- Create formatted reports.

Since the awk utility has many constructs common to programming languages, it provides a lot of features, such as conditional statements, loops, user-defined variables and functions, etc. But here we will only give a quick example to show how to use this utility.

The ability to create formatted reports that are easy to read and analyse comes in handy when working with log files.

The awk call looks like this:
```shell
awk options program file
```

Awk accepts incoming data as a set of records. The records are sets of fields. To put it simply, if we ignore the awk customization options and talk about some quite ordinary text, with lines separated by newline characters, a record is a string. A field is a word in a string.

### Position variables

Working with variables in awk is similar to working with command line parameters in bash. By default, awk assigns the following variables to each data field it detects in a record:
- $0 - represents the entire string of text (the record).
- $1 - the first field.
- $2 - the second field.
- $n - the nth field.

Fields are selected from the text using a delimiter character. By default these are space characters like the spacebar or a tab.

### Using multiple commands

Awk allows you to process data using multi-line scripts. To pass a multi-line command to awk when calling it from the console, you need to separate its parts with a semicolon:
```shell
echo "My name is Tom" |
awk '{
$4="Adam";
print $0
}'
```

In this example, the first command records the new value into the `$4` variable, and the second command outputs the whole string. The result of the script:
```shell
My name is Adam
```

### Formatted data output

The printf command in awk allows you to output formatted data using format specifiers.

The format specifiers are entered as follows:
```shell
%[modifier]control-letter
```

Here are some of them:
- c — prints a number as an ASCII character and outputs it
- d — prints a decimal integer
- i — also prints a decimal integer.
- e — prints a number in exponential notation.
- f —  prints a number in floating point notation.
- g — prints a number in either exponential notation or floating point notation, whichever uses fewer characters.
- o — prints the octal representation of the number.
- s — prints a string.

Here is an example of formatting the output using printf:
```shell
awk 'BEGIN{
x = 100 * 100
printf "The result is: %e\n", x
}'
```
