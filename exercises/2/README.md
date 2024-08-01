# Second Excersise

In this exercise, you need to write appropriate shell scripts for the following questions.

### 1. Write a shell script that takes a directory path as an `input argument`. Checks if the directory exists; if not, it prints an error message and exits with `code 2`. Compresses the entire directory into a `.tar.gz` file with the combine of directory name and current timestamp in its name. At the end moves the compressed file to a backup directory. (You need to use `tar`, `if`, `exit`, `mv`, `echo` and `mkdir` commands)

> [!NOTE]  
> If the backup directory doesn't exist your script must create it at the first.

<br>

### 2. Write a shell script that checks the internet connection. If the connection is lost, your script must create a notification to alert the user. (You need to use `ping`, `while`, `sleep` and `notify-send` commands)

> [!NOTE]  
> If the ping result is unsuccessful, you should check whether you are connected to an adapter. Appropriate messages should be given to the user for both cases of being disconnected from the adapter and being connected to the adapter without internet.
