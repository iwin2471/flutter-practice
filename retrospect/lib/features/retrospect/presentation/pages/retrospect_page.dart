import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';
import 'package:retrospect/features/retrospect/presentation/bloc/bloc.dart';
import 'package:retrospect/features/retrospect/presentation/widgets/retrospect_widget.dart';

class RetroSpectPage extends StatelessWidget {
  const RetroSpectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyBlocBuilder(context);
  }

  BlocBuilder<RetrospectBloc, RetrospectState> _bodyBlocBuilder(
      BuildContext context) {
    return BlocBuilder<RetrospectBloc, RetrospectState>(
      bloc: BlocProvider.of<RetrospectBloc>(context),
      builder: (BuildContext context, RetrospectState state) {
        if (state is InitialRetrospectState) {
          BlocProvider.of<RetrospectBloc>(context).add(StartRetrospect());
        }
        if (state is LoadRetrospectState) {
          return _retroSpectListView(state.listRetrospect);
        }
        if (state is UpdateRetrospectState) {
          return _retroSpectListView(state.listRetrospect);
        }
        return Container();
      },
    );
  }

  ListView _retroSpectListView(List<Retrospect> list) {
    return ListView(
      children: list
          .map<RetroSpectWidget>((retrospect) => RetroSpectWidget(
                retrospect: retrospect,
              ))
          .toList(),
    );
  }
}
