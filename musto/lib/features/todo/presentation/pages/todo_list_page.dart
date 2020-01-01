import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musto/features/todo/data/models/Todo.dart';
import 'package:musto/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:musto/features/todo/presentation/bloc/todo_state.dart';
import 'package:musto/features/todo/presentation/pages/add_todo.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<TodoBloc>(context);
    return buildBody(context, counterBloc);
  }

  Scaffold buildBody(BuildContext context, TodoBloc counterBloc) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<AddTodo>(
                      builder: (context) {
                        return BlocProvider.value(
                          value: counterBloc,
                          child: AddTodo(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, TodoState state) {
            if (state is InitialTodoState) {
              return Container();
            } else if (state is Initialized) {
              return ListView(
                children: state.todoList
                    .map<Widget>((todo) => todoWidget(todo))
                    .toList(),
              );
            } else if (state is Modified) {
              return ListView(
                children: state.todoList
                    .map<Widget>((todo) => todoWidget(todo))
                    .toList(),
              );
            }
          },
        ));
  }

  Widget todoWidget(Todo todo) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(todo.title),
          Text(todo.summary),
        ],
      ),
    );
  }
}
