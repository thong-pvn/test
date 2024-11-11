import 'package:example/providers/counter_async_notifier_provider.dart';
import 'package:example/providers/counter_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterStateProvider);
    final counter = ref.watch(counterAsyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen'),),
      body: Column(
        children: [
          counter.when(
              data: (data) => Text('You have pushed the button this many times: $data'),
              error: (error, _) => Text('$error'),
              loading: () => const CircularProgressIndicator()
          )
          // const Text('You have pushed the button this many times:'),
          // Text('$counter', style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                // ref.read(counterStateProvider.notifier).state++;
                ref.read(counterAsyncNotifierProvider.notifier).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),),
            FloatingActionButton(
              onPressed: () {
                // ref.read(counterStateProvider.notifier).state--;
                ref.read(counterAsyncNotifierProvider.notifier).decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterAsyncNotifierProvider.notifier).reset();
              },
              tooltip: 'Reset',
              child: const Icon(Icons.reset_tv),),
          ],
        )
    );
  }
}
