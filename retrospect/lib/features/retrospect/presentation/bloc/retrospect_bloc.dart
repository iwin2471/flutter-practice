import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:retrospect/features/retrospect/data/repositories/retrospect_repository.dart';
import './bloc.dart';

class RetrospectBloc extends Bloc<RetrospectEvent, RetrospectState> {
  @override
  RetrospectState get initialState => InitialRetrospectState();

  StreamSubscription _subscription;
  RetrospectRepository _repository = RetrospectRepository();

  @override
  Stream<RetrospectState> mapEventToState(
    RetrospectEvent event,
  ) async* {
    if (event is StartRetrospect) {
      _subscription?.cancel();
      _subscription = _repository.getData().listen((onData) {});
      yield LoadRetrospectState();
    }
  }
}
