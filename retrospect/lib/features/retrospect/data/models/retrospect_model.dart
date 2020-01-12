import 'package:equatable/equatable.dart';
import 'package:retrospect/features/retrospect/domain/entities/retrospect_entity.dart';

class Retrospect extends Equatable {
  final int id;
  final String issue;
  final String today;
  final String email;
  final DateTime time;

  Retrospect(this.id, this.issue, this.today, this.email, this.time);

  Map<String, Object> toJson() {
    return {
      "id": this.id,
      "issue": issue,
      "today": today,
      "email": email,
      "time": time.toIso8601String()
    };
  }

  RetrospectEntity toEntity() {
    return RetrospectEntity(id, issue, today, email, time);
  }

  Retrospect.fromEntity(RetrospectEntity entity)
      : this.id = entity.id,
        this.issue = entity.issue,
        this.today = entity.today,
        this.email = entity.email,
        this.time = entity.time;

  @override
  // TODO: implement props
  List<Object> get props => [id, issue, today, email, time];
}
