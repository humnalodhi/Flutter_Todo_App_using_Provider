import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_provider/Screens/todo_app_view.dart';
import 'package:provider/provider.dart';

import 'Providers/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TodoProvider()),
      child: MaterialApp(
        title: 'Simple ToDo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const TodoApp(),
      ),
    );
  }
}

