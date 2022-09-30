# DAT103 - Oblig 1
## Obligatory Assignment - Words Reversal

The assignment will demonstrate:
* How a simple algorithm is run at the hardware level, i.e. how high-level program code translates to assembly. To this end, you will implement a function that reverses the order of words in a string.
* How the Unix shell can be used to automate tasks and to tie low-level programs (like this string reversal) together to do more complicated work. In the example, this entails pre- and post-processing of the input, and storage of auxiliary data.


This project consists of two parts:
> Part I: A bash script that reads input, splits it up, uses standard tools to categorize it and writes/reads some
files, in order to make it simpler to reverse the words.

> Part II: An assembly program that does the simplified reversal operation.

## Subtask 1: Command Experiments
### 1A - Directories and Files
[📷0] - Set up scratch directory whose name includes your student number<br>
[📷1] - Create a text file containing the first paragraph of Lorem Ipsum<br>
[📷2] - Check that the file was indeed created<br>
[📷3] - Check that the file contains the intended text

### 1B - Newlines / Separator Characters
[📷4] - Run a command whose output is of the form *Lorem ipsum...elit,|sed do eiusmod...magna|aliqua...*<br>
[📷5] - Split the text again up in lines, each containing alternately a single word or a word-separating space/punctuation string.

### 1C - Hash substitutions
[📷6] - Store one of the punctuations in a shell variable<br>
[📷7] - Devise a single command that will generate a file containing that string, with the hash as the file name<br>
[📷8] - Test this for several different punctuations, then check that the corresponding files have been created<br>
[📷9] - Check that the files have the intended content

## Subtask 2: Depunctuation Script
Automate the commands you explored in the previous section. Write a script *depunctuate.sh* that
* Takes one command-line argument: the directory in which to store the hash lookups.
* Reads a text from standard input.
* Generates all required lookup files in the directory.
* Outputs the preprocessed text, in the form of lines alternating between single words and punctuation-hashes as.

## Subtask 3: Repunctuation Script
In a similar vein, write a script *repunctuate.sh* that inverses the transformation of *depunctuate.sh*, i.e. it
* Takes the same command-line argument: now the directory in which to search for hash-lookup files.
* Reads a text from standard input.
* Uses the lookup files to substitute back the original punctuation.
* Re-assembles the original line breaks.

## Subtask 4: Putting it All Together
Now write the script words-reverse.sh, which
* Takes no command-line arguments, or the single argument --bypass. Any other arguments should result
in an error.
* Creates a unique temporary directory for the hash lookups.
* Passes standard input to depunctuate.sh, with the created directory as the argument.
* Passes its output to the low-level reverser words-reverse-ll (since that will only be implemented in the next assignment, you can not test this part yet), unless invoked with --bypass, in which case this step is skipped or passed to cat instead.
* Passes this output to repunctuate.sh, again with the lookup directory.
* Gives back this final result on standard output.
* Cleans up the hash lookups <br>
[📷10] - Test the script extensively, with both the provided example text and input of your own choice.
