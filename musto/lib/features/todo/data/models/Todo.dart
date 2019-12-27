import 'package:flutter/material.dart';

class Todo {
  final int id;
  final String title;
  final String summary;
  final DateTime dateTime;

  Todo({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.dateTime,
  });
}
