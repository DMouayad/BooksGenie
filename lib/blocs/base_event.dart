import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocEvent<R, State> {
  const BaseBlocEvent();

  Future<void> handle(
    R repository,
    State state,
    Emitter<State> emit,
  );
}
