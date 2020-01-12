import 'package:firebase_database/firebase_database.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';

abstract class RetrospectRepository {
  Stream<Retrospect> getData();
  Retrospect convertData(Event convert);
  Future<List<Retrospect>> listRetrospects();
}
