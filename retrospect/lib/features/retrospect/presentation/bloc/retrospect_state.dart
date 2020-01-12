import 'package:equatable/equatable.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';

abstract class RetrospectState {
  const RetrospectState();

  @override
  List<Object> get props => [];
}

class InitialRetrospectState extends RetrospectState {
  @override
  List<Object> get props => [];
}

class LoadRetrospectState extends RetrospectState {
  final List<Retrospect> listRetrospect;

  const LoadRetrospectState([this.listRetrospect = const []]);

  @override
  List<Object> get props => listRetrospect;
}

class UpdateRetrospectState extends RetrospectState {
  final List<Retrospect> listRetrospect;

  const UpdateRetrospectState([this.listRetrospect = const []]);

  @override
  List<Object> get props => listRetrospect;
}
