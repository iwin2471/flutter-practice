import 'package:equatable/equatable.dart';

class RetrospectEntity extends Equatable {
  final int id;
  final String issue;
  final String today;
  final String email;
  final DateTime time;

  RetrospectEntity(this.id, this.issue, this.today, this.email, this.time);

  @override
  // TODO: implement props
  List<Object> get props => null;

  Map<String, Object> toJson() {
    return {
      "id": this.id,
      "issue": issue,
      "today": today,
      "email": email,
      "time": time.toIso8601String()
    };
  }

  RetrospectEntity.fromJson(Map<String, dynamic> json)
      : this.id = json["id"],
        this.issue = "${json["issue"]}",
        this.today = "${json["today"]}",
        this.email = "${json["email"]}",
        this.time = DateTime.parse(json["time"] as String);
}
