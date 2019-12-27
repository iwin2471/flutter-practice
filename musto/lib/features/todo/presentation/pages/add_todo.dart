import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musto/features/todo/data/models/Todo.dart';
import 'package:musto/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:musto/features/todo/presentation/bloc/todo_event.dart';

class AddTodo extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {"title": "", "summary": ""};

  AddTodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: formBody(context),
    );
  }

  Form formBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: "title"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _formData["title"] = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "summary",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _formData["summary"] = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Todo _todo = Todo(
                          id: 1,
                          title: _formData["title"],
                          summary: _formData["summary"],
                          dateTime: new DateTime.now());

                      BlocProvider.of<TodoBloc>(context).add(Add(todo: _todo));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
