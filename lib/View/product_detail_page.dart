import 'package:dartz/dartz.dart';
import 'package:gourmet/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routeborn/routeborn.dart';

class ProductDetailPage extends RoutebornPage {
  static const pagePathBase = 'product_detail';

  ProductDetailPage()
      : super.builder(pagePathBase, (_) => ProductDetailPageView());

  @override
  Either<ValueListenable<String?>, String> getPageName(BuildContext context) =>
      Right('');

  @override
  String getPagePath() => pagePathBase;

  @override
  String getPagePathBase() => pagePathBase;
}

class ProductDetailPageView extends HookConsumerWidget {
  const ProductDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.redAccent,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.watch(navigationNotifierProvider).popPage(context);
          },
          child: Text('Pop product detail'),
        ),
      ),
    );
  }
}
