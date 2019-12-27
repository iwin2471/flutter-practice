import 'package:equatable/equatable.dart';
import 'package:musto/features/todo/data/models/Todo.dart';

abstract class TodoState extends Equatable {
  final List<Todo> todoList;
  const TodoState(this.todoList);
}

class InitialTodoState extends TodoState {
  InitialTodoState(List<Todo> todoList) : super(todoList);

  @override
  List<Todo> get props => todoList;
}

class Initialized extends TodoState {
  Initialized(List<Todo> todoList) : super(todoList);

  @override
  List<Todo> get props => todoList;
}

class Modified extends TodoState {
  Modified(List<Todo> todoList) : super(todoList);

  @override
  List<Todo> get props => todoList;
}
