import 'package:firebase_database/firebase_database.dart';

class RetrospectRepository {
  final databaseReference = FirebaseDatabase.instance
      .reference()
      .child('1Nw0YAMZCLbheDxbii6Lrxkrm4ocIbp1uJ0d75TZLXHU');

  Stream getData() {
    return databaseReference.onChildAdded.asyncMap(_convertData);
  }

  _convertData(Event convert) {
    dynamic test = convert.snapshot.value;
    print(test);
    return test;
  }
}
