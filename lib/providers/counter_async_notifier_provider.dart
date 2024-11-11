import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifierProvider = AsyncNotifierProvider<CounterAsyncNotifier, int>(() {
  return CounterAsyncNotifier();
});

class CounterAsyncNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    final value = await Future.delayed(const Duration(seconds: 5), () => 0);
    return value;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    final value = await Future.delayed(const Duration(seconds: 1), () => state.value) ?? 0;
    state = AsyncValue.data(value + 1);
  }

  Future<void> decrement() async {
    state = const AsyncLoading();
    final value = await Future.delayed(const Duration(seconds: 1), () => state.value) ?? 0;
    state = AsyncValue.data(value - 1);
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    final value = await Future.delayed(const Duration(seconds: 1), () => state.value) ?? 0;
    state = const AsyncValue.data(0);
  }
}