import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/my_theme.dart';
import 'package:flutter/material.dart';

class AccountPage extends RoutebornPage {
  static const pagePathBase = 'account';

  AccountPage() : super.builder(pagePathBase, (_) => AccountPageView());

  @override
  Either<ValueListenable<String?>, String> getPageName(BuildContext context) =>
      Right('');

  @override
  String getPagePath() => pagePathBase;

  @override
  String getPagePathBase() => pagePathBase;
}

class AccountPageView extends HookConsumerWidget {
  const AccountPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeProvider.notifier);

    return Center(
        child: Column(
      children: [
        Text("Toggle theme"),
        ElevatedButton(
            onPressed: () => selectedTheme.update((state) => ThemeData.dark()),
            child: Text("Dark mode")),
        ElevatedButton(
            onPressed: () => selectedTheme.update((state) => ThemeData.light()),
            child: Text("Light mode"))
      ],
    ));
  }
}
