import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_counter_app_v2/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;  // Use 'late' to declare a non-nullable variable without initializing it immediately

    setUp(() {
      counterCubit = CounterCubit();  // Initialize the CounterCubit in the setUp method
    });

    tearDown(() {
      counterCubit.close();  // Ensure the CounterCubit is closed after each test
    });

    test('initial state of CounterCubit is CounterState(counterValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the CounterCubit should emit a CounterState(counterValue:1, wasIncremented:true) when the increment function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the CounterCubit should emit a CounterState(counterValue:-1, wasIncremented:false) when the decrement function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
