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
  // TODO : add const to the constructor shown below
  AccountPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final coverHeight = height * 0.25;
    final profileHeight = coverHeight * 0.5;
    final horizontalDiaryHeight = height * 0.3;

    final double top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Center(
        child: Column(
      children: [
        //プロフィール画像とカバー画像のUI
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: bottom),
                child: buildCoverImage(coverHeight)),
            Positioned(top: top, child: buildProfileImage(profileHeight / 2)),
          ],
        ),
        //TODO : light,darkテーマの切り替え(後で場所変える)
        SingleChildScrollView(
          child: Expanded(
            //横スクロールの日記一覧
            child: buildHorizontalDiaryView(),
          ),
        )
      ],
    ));
  }

  Widget buildHorizontalDiaryView() => Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("xxxxの日記", style: TextStyle(fontSize: 14, color: txtColor)),
              Row(
                children: [
                  Text("Check→",
                      style: TextStyle(fontSize: 14, color: txtColor)),
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      iconSize: 21,
                      onPressed: () {},
                      icon: Icon(
                        Icons.book,
                        color: txtColor,
                      ))
                ],
              )
            ],
          ),
          buildHorizontalDiary()
        ],
      );
  Widget buildCoverImage(double height) => Container(
      color: Colors.grey,
      child: Image.network(
          'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
          width: double.infinity,
          height: height,
          fit: BoxFit.cover));

  Widget buildProfileImage(double height) => CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      radius: height,
      backgroundImage: NetworkImage(
          'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/profileImage1-35RHzij3TSfj9yrmof5M2iMiD413?alt=media&token=dea3a5aa-afbc-4efd-911d-fb4d4e99b0c9'));

  final List<Widget> _diaryList = [
    Container(
        color: Colors.grey,
        child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
            width: 100,
            height: 100,
            fit: BoxFit.cover)),
    Container(
        color: Colors.grey,
        child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
            width: 100,
            height: 100,
            fit: BoxFit.cover)),
    Container(
        color: Colors.grey,
        child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
            width: 100,
            height: 100,
            fit: BoxFit.cover)),
    Container(
        color: Colors.grey,
        child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
            width: 100,
            height: 100,
            fit: BoxFit.cover)),
  ];
  Widget buildHorizontalDiary() => SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        itemCount: _diaryList.length,
        //横スクロールに変更
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [_diaryList[index], SizedBox(width: 10)],
          );
        },
      ));
}
