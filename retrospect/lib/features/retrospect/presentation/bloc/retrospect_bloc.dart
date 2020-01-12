import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:retrospect/features/retrospect/data/models/retrospect_model.dart';
import 'package:retrospect/features/retrospect/data/repositories/retrospect_repository_impl.dart';
import './bloc.dart';

class RetrospectBloc extends Bloc<RetrospectEvent, RetrospectState> {
  @override
  RetrospectState get initialState => InitialRetrospectState();

  StreamSubscription _subscription;
  RetrospectRepositoryImpl _repository = RetrospectRepositoryImpl();
  List<Retrospect> _listRetrospects;

  @override
  Stream<RetrospectState> mapEventToState(
    RetrospectEvent event,
  ) async* {
    if (event is StartRetrospect) {
      _subscription?.cancel();
      _subscription = _repository
          .getData()
          .listen((onData) => this.add(AddRetroSpectEvent(onData)));
    }
    if (event is AddRetroSpectEvent) {
      yield* _mapAddRetroSpectEventToState(event);
    }
    if (event is LoadedEvent) {
      yield LoadRetrospectState(event.retrospects);
    }
  }

  Stream<RetrospectState> _mapStartRetrospectToState() async* {
    List<Retrospect> loaded = await _repository.listRetrospects();
    _listRetrospects = loaded;
    yield LoadRetrospectState(_listRetrospects);
  }

  Stream<RetrospectState> _mapAddRetroSpectEventToState(
      AddRetroSpectEvent event) async* {
    if (_listRetrospects == null) yield* _mapStartRetrospectToState();
    _listRetrospects.add(event.retrospect);
    yield UpdateRetrospectState(_listRetrospects);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
