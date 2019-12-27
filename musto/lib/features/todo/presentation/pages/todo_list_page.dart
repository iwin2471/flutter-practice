import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musto/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:musto/features/todo/presentation/bloc/todo_state.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  BlocProvider<TodoBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoBloc(),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is InitialTodoState) {}
        },
      ),
    );
  }
}
