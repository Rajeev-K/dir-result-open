# dir-result-open
Emacs extension to open files from output of Windows dir command.

## How to use
Conveniently search for and open files as follows:

Open Command Prompt and run this command: 
`dir /s > \temp\all-files.txt`

Then open the above text file in Emacs. Now you can use Emacs' incremental search feature to search for file names. Once you find a file simply press F12 to open the file.
