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
import 'package:carousel_slider/carousel_slider.dart';

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
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          buildDiary(height: _height),
          Divider(
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          buildDiary(height: _height)
        ],
      ))),
    ));
  }
}

final List<String> _imageList = [
  'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
  'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
  'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
  'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
  'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
  'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
];
final List<Widget> imageSliders = _imageList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item,
                        fit: BoxFit.cover, width: double.infinity),
                    //グラデーションの上にテキスト配置
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       'No. ${_imageList.indexOf(item)} image',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
    .toList();

class buildDiary extends StatelessWidget {
  buildDiary({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildUserIcon(height: _height),
        buildStoreInfo(),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ",
            style: TextStyle(fontSize: 18, color: txtDiaryColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
        //食事の画像
        CarouselWithIndicatorDemo()
      ],
    );
  }
}

class CarouselWithIndicatorDemo extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState
    extends ConsumerState<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            // height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            reverse: false,
            //以下は画像を横幅全部埋めたいとき
            // viewportFraction: 1.0,
            // enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

class buildUserIcon extends StatelessWidget {
  const buildUserIcon({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildUserInfo(height: _height),
        ],
      ),
    );
  }
}

class buildStoreInfo extends StatelessWidget {
  const buildStoreInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: buildRectImage(
              'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
              50,
              40),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Store name",
                style: TextStyle(fontSize: 18, color: txtWhiteColor),
              ),
              // Flexible(
              //   child: Text(
              //     "東京都渋谷区神南１－１９－３　ハイマンテン神南ビル　B1F",
              //     style: TextStyle(fontSize: 9, color: txtGreyColor),
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 3,
              //   ),
              // ),
              Text(
                "東京都渋谷区神南１－１９－３　ハイマンテン神南ビル　B1F",
                style: TextStyle(fontSize: 9, color: txtGreyColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class buildUserInfo extends StatelessWidget {
  const buildUserInfo({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildProfileImage(
              'https://firebasestorage.googleapis.com/v0/b/evewel-matching.appspot.com/o/wantedImage1-eY2BDJ4fu6B1ApR0C0mW?alt=media&token=049f10ea-4b4d-4c2c-b78f-9ccc058631df',
              _height * 0.05),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "username",
                style: TextStyle(fontSize: 14, color: txtWhiteColor),
              ),
              buildVerticalItem(_dummyHashTag, 14),
            ],
          ),
        ),
      ],
    );
  }
}

List<String> _dummyHashTag = ["#test1", "#test2", "#test3"];
Widget buildVerticalItem(List<String> listItem, double height) => SizedBox(
    width: double.infinity,
    height: height,
    child: ListView.builder(
      itemCount: listItem.length,
      //横スクロールに変更
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Text(listItem[index],
                style: TextStyle(fontSize: 12, color: tagColor)),
            SizedBox(width: 2)
          ],
        );
      },
    ));

Widget buildRectImage(String url, double width, double height) => SizedBox(
    width: width,
    height: height,
    child: Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            url.toString(),
            fit: BoxFit.cover,
          )),
    ));

Widget buildRectImageNoR(String url, double width, double height) => SizedBox(
    width: width,
    height: height,
    child: Container(
      child: Image.network(
        url.toString(),
        fit: BoxFit.cover,
      ),
    ));
