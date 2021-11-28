import 'package:gourmet/View/favorites_page.dart';
import 'package:gourmet/View/help_page.dart';
import 'package:gourmet/View/home_page.dart';
import 'package:gourmet/View/product_detail_page.dart';
import 'package:gourmet/View/shop_page.dart';
import 'package:routeborn/routeborn.dart';
import 'package:gourmet/View/account_page.dart';
import 'package:gourmet/View/write_diary_page.dart';
import 'package:gourmet/View/diarylist_page.dart';

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
