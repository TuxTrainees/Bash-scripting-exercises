# First Excersise

In this exercise, you need to write appropriate shell scripts for the following questions.

### 1. Write a shell script to print *hello world* in 10 different colors as output. (You need to use `echo` commands)
> [!NOTE]  
> Your script should be executed in the format of `./script.sh`.

> [!TIP]
> Do not write the word 'hello world' more than once. To do this, either use a loop structure or use a const variable.
```bash
# Format of constant variable in bash language:
readonly VARIABLE="data"
```

<br>

### 2. Write a shell script that read the `USER` variable from `$USER` and ask `PASSWORD` variable from the input in password mode. Then run the `ls /root` if the user exist in `sudo` or `wheel` group. (You need to use `read` and `if` commands) 
> [!NOTE]  
> Read about `read` command in bash script and it's options. 

<br>

### 3. Write a shell script that loop on the `$HOME` directory and print the result of `stat` command for each file and directory in `$HOME` path. (You need to use `for` or `while` commands)
> [!NOTE]
> You need also stat on hidden files.
