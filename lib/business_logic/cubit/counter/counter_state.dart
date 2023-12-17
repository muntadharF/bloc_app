part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterValueIsChanged extends CounterState {
  final int counter;

  CounterValueIsChanged({required this.counter});
}
