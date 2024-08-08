# Fifth exercise

### In this exercise, you need to write a basic task manager using shell scripts, similar to Taskwarrior but more simplified.

### Thing you need to do:

1. Add a Task: 
    - Create a shell script that allows the user to add a new task with a description and a due date. The tasks should be saved in a text file in the following format:

      Task ID: <id>
      Description: <description>
      Due Date: <due date>
      Status: <status>  (Pending/Completed)
      

2. List All Tasks:
    - Create a shell script that lists all the tasks in a user-friendly format. The listing should include the task ID, description, due date, and status (Pending/Completed).

3. Mark a Task as Completed:
    - Create a shell script that allows the user to mark a particular task as completed by providing the task ID.

4. Remove a Task:
    - Create a shell script that allows the user to delete a task by providing the task ID.


> [!NOTE]
> You need to have multifile shellscripts than call them in the main script. So create `add.sh`, `list.sh`, `modify.sh`, `remove.sh` and `main.sh`.
> The main.sh file must be interactive and, based on input arguments while running, perform the appropriate function.

> [!NOTE]
> Save the informations in task.txt in user home directory
