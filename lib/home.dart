import 'package:dartz/dartz.dart';
import 'package:gourmet/main.dart';
import 'package:gourmet/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/help_page.dart';

class HomePage extends RoutebornPage {
  static const pagePathBase = 'home';

  HomePage() : super.builder(pagePathBase, (_) => const HomePageView());

  @override
  Either<ValueListenable<String?>, String> getPageName(BuildContext context) =>
      const Right('');

  @override
  String getPagePath() => pagePathBase;

  @override
  String getPagePathBase() => pagePathBase;
}

final nestedRouterDelegate = Provider.autoDispose.family(
  (ref, branch) => RoutebornNestedRouterDelegate(
      ref.watch(navigationNotifierProvider),
      branch: branch),
);

class HomePageView extends HookConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  NestingBranch index2Branch(int index) {
    switch (index) {
      case 0:
        return NestingBranch.Home;
      case 1:
        return NestingBranch.Diary;
      case 2:
        return NestingBranch.WriteDiary;
      case 3:
        return NestingBranch.Favorite;
      case 4:
        return NestingBranch.Account;
    }
    throw FlutterError('Cannot have other branch');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(
      navigationNotifierProvider.select(
        (value) {
          switch (value.getNestingBranch(context, inChildNavigator: true)) {
            case NestingBranch.Home:
              return 0;
            case NestingBranch.Diary:
              return 1;
            case NestingBranch.WriteDiary:
              return 2;
            case NestingBranch.Favorite:
              return 3;
            case NestingBranch.Account:
              return 4;
          }
        },
      ),
    );

    final ctrl =
        useMemoized(() => CupertinoTabController(initialIndex: currentTab));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .watch(navigationNotifierProvider)
                  .pushPage(context, AppPageNode(page: HelpPage()));
            },
            icon: Icon(Icons.help),
          ),
        ],
      ),
      body: SafeArea(
        child: CupertinoTabScaffold(
          controller: ctrl,
          tabBar: CupertinoTabBar(
            onTap: (tabId) {
              // `setNestingBranch` here is called with the parameter `inChildNavigator: true`
              // Because the Router is in the same context.

              // Other possible solution in this case would be to wrap
              // `BottomNavigationBar` with `Builder()` widget. After that,
              // the parameter `inChildNavigator: true` would not be needed
              ref.watch(navigationNotifierProvider).setNestingBranch(
                    context,
                    index2Branch(tabId),
                    inChildNavigator: true,
                  );
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'diary'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'write'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'account'),
            ],
          ),
          tabBuilder: (BuildContext context, int index) =>
              _Tab(index2Branch(index)),
        ),
      ),
    );
  }
}

class _Tab extends HookConsumerWidget {
  final NestingBranch branch;

  const _Tab(this.branch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Router(routerDelegate: ref.watch(nestedRouterDelegate(branch)));
  }
}
