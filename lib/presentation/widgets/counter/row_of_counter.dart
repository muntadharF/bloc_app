import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/counter/counter_cubit.dart';
import '../../../constants/app_icons.dart';

class RowOfCounter extends StatelessWidget {
  const RowOfCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          heroTag: 'increment',
          onPressed: () {
            BlocProvider.of<CounterCubit>(context).increment();
          },
          child: AppIcons.increment,
        ),
        _buildCounterBlocBuilder(),
        FloatingActionButton(
          heroTag: 'decrement',
          onPressed: () {
            BlocProvider.of<CounterCubit>(context).decrement();
          },
          child: AppIcons.decrement,
        ),
      ],
    );
  }

  BlocBuilder<CounterCubit, CounterState> _buildCounterBlocBuilder() {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is CounterValueIsChanged) {
          return Text(
            'value is : ${(state).counter}',
            style: Theme.of(context).textTheme.titleLarge,
          );
        } else {
          return Text(
            'value is : 0',
            style: Theme.of(context).textTheme.titleLarge,
          );
        }
      },
    );
  }
}
