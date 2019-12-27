import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:musto/features/todo/data/models/Todo.dart';
import './bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<Todo> todoList;

  TodoBloc(this.todoList);

  @override
  TodoState get initialState => InitialTodoState([]);

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is Add) {
      todoList.add(event.todo);
      yield Modified(todoList);
    } else if (event is Delete) {
      todoList.remove(event.todo);
      yield Modified(todoList);
    }
  }
}
