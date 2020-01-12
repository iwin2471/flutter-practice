import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrospect/features/retrospect/presentation/bloc/bloc.dart';
import 'package:retrospect/features/retrospect/presentation/pages/retrospect_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RetrospectBloc>(
      create: (context) => RetrospectBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RetroSpectPage(),
      ),
    );
  }
}
