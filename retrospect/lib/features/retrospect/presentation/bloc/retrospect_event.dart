import 'package:equatable/equatable.dart';

abstract class RetrospectEvent extends Equatable {
  const RetrospectEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartRetrospect extends RetrospectEvent {}
