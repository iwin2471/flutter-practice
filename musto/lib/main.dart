import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musto/features/todo/data/models/Todo.dart';
import 'package:musto/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:musto/features/todo/presentation/pages/add_todo.dart';
import 'package:musto/features/todo/presentation/pages/todo_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
        create: (BuildContext context) => TodoBloc([
              Todo(
                id: 1,
                title: "test",
                summary: "test",
                dateTime: new DateTime.now(),
              )
            ]),
        child: MaterialApp(
          title: 'Todo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TodoListPage(),
          routes: {
            "/add": (BuildContext context) => AddTodo(),
          },
        ));
  }
}
