import 'package:flutter/material.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';

class RetroSpectWidget extends StatelessWidget {
  final Retrospect retrospect;

  const RetroSpectWidget({Key key, @required this.retrospect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("${retrospect.id}"),
          Text("${retrospect.email}"),
          Text("${retrospect.issue}"),
          Text("${retrospect.today}"),
        ],
      ),
    );
  }
}
