import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'myTheme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderを読み取る。watchを使用しているので、
    // state（状態）であるTODOリストが更新されると、buildメソッドが再実行されて画面が更新される
    final myTheme = ref.watch(themetNotifierProvider);
    // TodoListNotifier を使用する場合は `.notifier` を付けてProviderを読み取る
    final notifier = ref.watch(themetNotifierProvider.notifier);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: Container(
        child: Row(
          children: [ElevatedButton(onPressed: notifier.toggle(), child: Text("test"))],
        ),
      ),
    );
  }
}
