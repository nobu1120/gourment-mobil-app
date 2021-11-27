import 'package:gourmet/favorites_page.dart';
import 'package:gourmet/help_page.dart';
import 'package:gourmet/home.dart';
import 'package:gourmet/product_detail_page.dart';
import 'package:gourmet/shop_page.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/account_page.dart';
import 'package:gourmet/write_diary.dart';
import 'package:gourmet/diarylist_page.dart';

enum NestingBranch { Home, Diary, WriteDiary, Favorite, Account }

final routes = <String, RouteNode<NestingBranch>>{
  HomePage.pagePathBase: RouteNode(
    NonParametrizedPage(() => HomePage()),
    nestedBranches: NestedBranches(
      defaultBranch: NestingBranch.Home,
      branches: {
        NestingBranch.Home: BranchInitNode(
          ShopPage.pagePathBase,
          RouteNode(
            NonParametrizedPage(() => ShopPage()),
            routes: {
              ProductDetailPage.pagePathBase:
                  RouteNode(NonParametrizedPage(() => ProductDetailPage()))
            },
          ),
        ),
        NestingBranch.Diary: BranchInitNode(
          DiaryListPage.pagePathBase,
          RouteNode(NonParametrizedPage(() => DiaryListPage())),
        ),
        NestingBranch.WriteDiary: BranchInitNode(
          WriteDiaryPage.pagePathBase,
          RouteNode(NonParametrizedPage(() => WriteDiaryPage())),
        ),
        NestingBranch.Favorite: BranchInitNode(
          FavoritesPage.pagePathBase,
          RouteNode(NonParametrizedPage(() => FavoritesPage())),
        ),
        NestingBranch.Account: BranchInitNode(
          AccountPage.pagePathBase,
          RouteNode(NonParametrizedPage(() => AccountPage())),
        )
      },
    ),
    routes: {
      HelpPage.pagePathBase: RouteNode(NonParametrizedPage(() => HelpPage()))
    },
  ),
};
