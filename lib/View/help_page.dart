import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/my_theme.dart';

import '../../main.dart';

class HelpPage extends RoutebornPage {
  static const pagePathBase = 'help';

  HelpPage()
      : super.builder(
          pagePathBase,
          (_) => HelpPageView(),
        );

  @override
  Either<ValueListenable<String?>, String> getPageName(BuildContext context) =>
      Right('');

  @override
  String getPagePath() => pagePathBase;

  @override
  String getPagePathBase() => pagePathBase;
}

class HelpPageView extends HookConsumerWidget {
  const HelpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeProvider.notifier);

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Settings"),
            ),
            body: Center(
              child: Column(
                children: [
                  Text("Toggle theme"),
                  ElevatedButton(
                      onPressed: () => selectedTheme
                          .update((state) => state = ThemeData.dark()),
                      child: Text("Dark mode")),
                  ElevatedButton(
                      onPressed: () => selectedTheme
                          .update((state) => state = ThemeData.light()),
                      child: Text("Light mode")),
                  ElevatedButton(
                    onPressed: () {
                      ref.watch(navigationNotifierProvider).popPage(context);
                    },
                    child: Text('Pop help page'),
                  )
                ],
              ),
            )));
  }
}
