#Bash scripts, part 6: sed and text editing

### A short digression – a pipe in bash.

Pipe is a unidirectional channel of inter-process communication.
Pipes are mostly used in shell scripts to link multiple commands by redirecting the output of one command (stdout) to the input (stdin) of a subsequent command, using `|`:
```shell
cmd1 | cmd2 | .... | cmdN
```

For example:
```shell
index=$(echo $arg | cut -f1 -d=)
val=$(echo $arg | cut -f2 -d=)
```

The `cut` command is used if you need to cut a part of the text. The `f` key specifies a list of fields to cut. The `d` key sets the separator between the fields.

So if the `arg` variable contains, for example, `X=45`, the variable `index` will be `X`, and `val` will be `45`.

You can also use the pipe to sort the array from the previous command.

### Basics of sed

The sed utility is called a streaming text editor. It allows you to edit data streams based on rule sets specified by the developer. This is what a call of this command looks like:
```shell
sed options file
```

By default, sed applies the rules specified when called, looking like a set of commands, to STDIN. This allows data to be transmitted directly to sed. For example, like this:
```shell
echo "This is a test" |
sed 's/test/another test/'
```

In this case sed replaces the word "test" in the line passed for processing with "another test". In our case, the command used is `s/pattern1/pattern2/`. The letter "s" is an abbreviation of the word "substitute" - substitute command. When Sed executes this command, it will look through the transmitted text and replace any fragments found in it that match pattern1 with pattern2.

To perform multiple actions on the data, use the -e key when calling sed. For example, here's the replacement of two pieces of a text:
```shell
sed -e 's/This/That/; s/test/another test/'
```

sed also has commands for handling arrays, such as leaving only a certain number of elements, or arranging element numbers.

### Selection of text fragments to be processed

Here is another example. In some cases, sed can be used to process just a part of the text, a specific line or group of lines. To achieve this, you can set a limit to the number of lines to be processed.

Contents of myfile:
```
This is a test.
This is the second test.
This is the third test.
This is the fourth test.
```

Let's look at an example that involves specifying the number of one line to be processed:
```shell
sed '2s/test/another test/' myfile
```


The result of the script:
```
This is a test.
This is the second another test.
This is the third test.
This is the fourth test.
```

The second option is a range of lines:
```shell
sed '2,3s/test/another test/' myfile
```

The result of the work:
```
This is a test.
This is the second another test.
This is the third another test.
This is the fourth test.
```

You can also call the replace command so that the file is processed from a certain line all the way to the end.  In this case use " $ " :
```shell
sed '2,$s/test/another test/' myfile
```

The result:
```
This is a test.
This is the second another test.
This is the third another test.
This is the fourth another test.
```
