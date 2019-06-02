# dir-result-open
Emacs extension to open files from output of Windows dir command.

## How to use
Conveniently search for and open files as follows:

Open Command Prompt and run this command in your source code folder:
`dir /s > \temp\all-files.txt`

Then open `all-files.txt` in Emacs. Now you can use Emacs' incremental search feature to search for file names (which is the point of this extension). Once you find a file simply press F12 to open the file.

## How does it work?
The last word on the current line is extracted as the file name. Then we scan backwards to look for a line of the form `Directory of XXX`. The directory name is obtained from that line, then the full path is contstructed and the file is opened.
