import 'package:gourmet/View/home_page.dart';
import 'package:gourmet/my_theme.dart';
import 'package:gourmet/View/page_404.dart';
import 'package:gourmet/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

NavigationStack<NestingBranch> initialPages() => NavigationStack(
      [AppPageNode(page: HomePage())],
    );

final navigationNotifierProvider =
    ChangeNotifierProvider((_) => NavigationNotifier(routes));

final rootRouterDelegate = Provider((ref) =>
    RoutebornRootRouterDelegate(ref.watch(navigationNotifierProvider)));

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Gourmet",
      theme: ref.watch(themeProvider),
      routerDelegate: ref.watch(rootRouterDelegate),
      routeInformationParser: RoutebornRouteInfoParser(
        page404: Page404(),
        initialStackBuilder: initialPages,
        routes: routes,
      ),
    );
  }
}




// The souirce shown below is switching theme


// class MyApp extends ConsumerWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedTheme = ref.watch(themeProvider.notifier);

//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ref.watch(themeProvider) == 0
//             ? ThemeData.dark()
//             : ThemeData.light(),
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text("toggle theme"),
//           ),
//           body: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       selectedTheme.update((state) => state == 1 ? 0 : 1);
//                       print(ref.watch(themeProvider));
//                     },
//                     child: Text("Toggle Theme")),
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return Home();
//                           },
//                         ),
//                       );
//                     },
//                     child: Text("GogoHome"))
//               ],
//             ),
//           ),
//         ));
//   }
// }