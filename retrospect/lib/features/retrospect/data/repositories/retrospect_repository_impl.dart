import 'package:firebase_database/firebase_database.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';
import 'package:retrospect/features/retrospect/domain/entities/retrospect_entity.dart';
import 'package:retrospect/features/retrospect/domain/repositories/retrospect_repository.dart';

class RetrospectRepositoryImpl implements RetrospectRepository {
  final databaseReference = FirebaseDatabase.instance
      .reference()
      .child('1Nw0YAMZCLbheDxbii6Lrxkrm4ocIbp1uJ0d75TZLXHU')
      .child("설문지 응답 시트1");

  @override
  Retrospect convertData(Event event) {
    return Retrospect.fromEntity(
      RetrospectEntity.fromJson(
          Map<String, dynamic>.from(event.snapshot.value)),
    );
  }

  @override
  Stream<Retrospect> getData() {
    return databaseReference.onChildAdded.where((Event event) {
      Map<String, dynamic> entity =
          Map<String, dynamic>.from(event.snapshot.value);
      if (entity == null) return false;
      String id = "${entity["id"]}";
      return entity["id"] != null && id.isNotEmpty;
    }).map(convertData);
  }

  @override
  Future<List<Retrospect>> listRetrospects() async {
    return databaseReference.once().then((DataSnapshot snapshot) {
      List<dynamic> temp = snapshot.value;

      return temp.where((entity) {
        if (entity == null) return false;
        String id = "${entity["id"]}";
        return entity["id"] != null && id.isNotEmpty;
      }).map<Retrospect>((entity) {
        return Retrospect.fromEntity(
          RetrospectEntity.fromJson(Map<String, dynamic>.from(entity)),
        );
      }).toList();
    });
  }
}
