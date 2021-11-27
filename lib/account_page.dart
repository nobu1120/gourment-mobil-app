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

// TODO : to use font awesome icon
// TODO : let me check why the elevated button doens't work inside stack widget
class AccountPageView extends HookConsumerWidget {
  const AccountPageView({Key? key}) : super(key: key);
  final double coverHeight = 180;
  final double profileHeight = 60;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeProvider.notifier);
    final double top = coverHeight - profileHeight / 2;

    return Center(
        child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            buildCoverImage(),
            Positioned(top: top, child: buildProfileImage()),
            Positioned(
                top: coverHeight + profileHeight / 2 + 20,
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
                        child: Text("Light mode"))
                  ],
                ))
          ],
        ),
      ],
    ));
  }

  Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network(
          'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover));

  Widget buildProfileImage() => CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      radius: profileHeight / 2,
      backgroundImage: NetworkImage(
          'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/profileImage1-35RHzij3TSfj9yrmof5M2iMiD413?alt=media&token=dea3a5aa-afbc-4efd-911d-fb4d4e99b0c9'));
}
