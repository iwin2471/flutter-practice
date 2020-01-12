import 'package:equatable/equatable.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';

abstract class RetrospectEvent extends Equatable {
  const RetrospectEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartRetrospect extends RetrospectEvent {}

class AddRetroSpectEvent extends RetrospectEvent {
  final Retrospect retrospect;

  AddRetroSpectEvent(this.retrospect);
}

class LoadedEvent extends RetrospectEvent {
  final List<Retrospect> retrospects;

  LoadedEvent(this.retrospects);

}
