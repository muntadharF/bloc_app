// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;

  CounterCubit() : super(CounterInitial());

  void increment() => emit(CounterValueIsChanged(counter: ++counter));
  void decrement() => emit(CounterValueIsChanged(counter: --counter));
}
