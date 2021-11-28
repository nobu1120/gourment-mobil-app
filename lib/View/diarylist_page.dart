import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/my_theme.dart';
import 'package:flutter/material.dart';

class DiaryListPage extends RoutebornPage {
  static const pagePathBase = 'DiaryListPage';

  DiaryListPage() : super.builder(pagePathBase, (_) => DiaryListPageView());

  @override
  Either<ValueListenable<String?>, String> getPageName(BuildContext context) =>
      Right('');

  @override
  String getPagePath() => pagePathBase;

  @override
  String getPagePathBase() => pagePathBase;
}

class DiaryListPageView extends HookConsumerWidget {
  const DiaryListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeProvider.notifier);

    return Center(
        child: Column(
      children: [
        Text("DiaryListPage"),
      ],
    ));
  }
}
