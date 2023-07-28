import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_provider/Providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoAction extends StatefulWidget {
  const TodoAction({super.key});

  @override
  State<TodoAction> createState() => _TodoActionState();
}

class _TodoActionState extends State<TodoAction> {
  @override
  Widget build(BuildContext context) {
    //store the value in a variable
    final task = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => ListTile(
        leading: Checkbox(
          // toggle the task as index item
          value: task.allTasks[index].completed,
          onChanged: ((_) => task.toggleTask(task.allTasks[index])),
        ),
        //show all the task title
        title: Text(task.allTasks[index].todoTitle),
        trailing: IconButton(
            onPressed: () {
              //delete task as index item
              task.deleteTask(task.allTasks[index]);
            },
            icon: const Icon(Icons.delete)),
      )),
    );
  }
}
