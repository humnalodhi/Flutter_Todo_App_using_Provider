import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_provider/Widgets/todo_action.dart';
import 'package:flutter_todo_app_with_provider/Providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  //creating initState() for adding listener to controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  //disposing the controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    //we aren't interested in updating our ui so listen will be false
    Provider.of<TodoProvider>(context, listen:    false).addTask(newTask);
    //cancelling the dialog
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task"),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                  child: const Text("Submit"),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: const TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddTextDialog();
        }),
        tooltip: "Add a todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
