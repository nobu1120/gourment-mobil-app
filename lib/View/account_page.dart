import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/my_theme.dart';
import 'package:flutter/material.dart';
import 'commonUI.dart';

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
    final profileHeight = coverHeight * 0.6;
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
            Positioned(
                top: top,
                child: buildProfileImage(
                    'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/profileImage1-35RHzij3TSfj9yrmof5M2iMiD413?alt=media&token=dea3a5aa-afbc-4efd-911d-fb4d4e99b0c9',
                    profileHeight / 2)),
          ],
        ),
        Text("xxxxx xxxxx",
            style: TextStyle(
                fontSize: 18,
                color: txtWhiteColor,
                fontWeight: FontWeight.bold)),
        Text("xx歳/男性", style: TextStyle(fontSize: 14, color: txtGreyColor)),
        //TODO : light,darkテーマの切り替え(後で場所変える)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Expanded(
                //横スクロールの日記一覧
                // TODO : when user scroll up to last contents , we can't back to original display
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHorizontalDiaryView(),
                    buildVerticalDiaryView()
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

// 日記一覧(横スクロール)
  Widget buildVerticalDiaryView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
              width: 300,
              child: Text("楽しかった思い出",
                  style: TextStyle(fontSize: 14, color: txtGreyColor))),
          buildVerticalDiary()
        ],
      );
  // 日記一覧(横スクロール)
  Widget buildHorizontalDiaryView() => Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("xxxxの日記",
                  style: TextStyle(fontSize: 14, color: txtGreyColor)),
              Row(
                children: [
                  Text("Check→",
                      style: TextStyle(fontSize: 14, color: txtGreyColor)),
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      iconSize: 21,
                      onPressed: () {},
                      icon: Icon(
                        Icons.book,
                        color: txtGreyColor,
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

  final List<Widget> _diaryList = [
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    dummyHorizontalDiary(),
    Container(
      color: Colors.orange,
      width: 100,
      height: 100,
      child: Center(child: Text("last")),
    )
  ];

  final List<Widget> _diaryVerticalList = [
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    dummyVerticalDiary(),
    Container(
      color: Colors.orange,
      width: 100,
      height: 100,
      child: Center(child: Text("last")),
    )
  ];

  Widget buildHorizontalDiary() => SizedBox(
      width: double.infinity,
      height: 100,
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
  Widget buildVerticalDiary() => SizedBox(
      width: double.infinity,
      height: 300,
      child: ListView.builder(
        itemCount: _diaryVerticalList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _diaryVerticalList[index],
              SizedBox(
                height: 10,
              )
            ],
          );
        },
      ));
}

class dummyHorizontalDiary extends StatelessWidget {
  const dummyHorizontalDiary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
            width: 100,
            height: 100,
            fit: BoxFit.cover));
  }
}

class dummyVerticalDiary extends StatelessWidget {
  const dummyVerticalDiary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            color: Colors.grey,
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
                width: 100,
                height: 100,
                fit: BoxFit.cover)),
        Flexible(
          child: Text(
            "Here is the area which user will describe the feeling at the restaurant",
            // textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 24.0, color: txtWhiteColor),
            maxLines: 3,
          ),
        )
      ],
    );
  }
}
