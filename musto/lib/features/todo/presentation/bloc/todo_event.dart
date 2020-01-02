import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:musto/features/todo/data/models/Todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class Add extends TodoEvent {
  final Todo todo;

  Add({@required this.todo});

  @override
  // TODO: implement props
  List<Todo> get props => null;
}

class Delete extends TodoEvent {
  final Todo todo;

  Delete({@required this.todo});

  @override
  // TODO: implement props
  List<Todo> get props => null;
}
