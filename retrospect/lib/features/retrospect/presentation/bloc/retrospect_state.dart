import 'package:equatable/equatable.dart';

abstract class RetrospectState extends Equatable {
  const RetrospectState();
  @override
  List<Object> get props => [];
}

class InitialRetrospectState extends RetrospectState {
  @override
  List<Object> get props => [];
}

class LoadRetrospectState extends RetrospectState {}
