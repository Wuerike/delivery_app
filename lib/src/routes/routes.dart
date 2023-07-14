import 'package:delivery_app/src/features/presentation/collection_detail_page/view/collection_detail_page.dart';
import 'package:delivery_app/src/features/presentation/collections_page/view/collections_page.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/filter_page.dart';
import 'package:delivery_app/src/features/presentation/update_password_page/view/update_password_page.dart';
import 'package:delivery_app/src/features/presentation/home_page/home_page.dart';
import 'package:delivery_app/src/features/presentation/place_detail_page/view/place_detail_page.dart';
import 'package:delivery_app/src/features/presentation/profile_detail_page/view/profile_detail_page.dart';
import 'package:delivery_app/src/features/presentation/search_page/view/search_page.dart';
import 'package:delivery_app/src/features/presentation/sign_in_page/view/sign_in_page.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/view/sign_up_page.dart';
import 'package:delivery_app/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:flutter/widgets.dart';

class RoutesPaths {
  static String welcome = "welcome";
  static String signIn = "sign-in";
  static String updatePassword = "update-password";
  static String signUp = "sign-up";
  static String home = "home";
  static String search = "search";
  static String filter = "filter";
  static String collections = "collections";
  static String collectionDetail = "collection-detail";
  static String placeDetail = "place-detail";
  static String profileDetail = "profile-detail";
}

final routes = <String, WidgetBuilder>{
  RoutesPaths.welcome: (BuildContext context) => WelcomePage(),
  RoutesPaths.signIn: (BuildContext context) => SignInPage(),
  RoutesPaths.updatePassword: (BuildContext context) => UpdatePasswordPage(),
  RoutesPaths.signUp: (BuildContext context) => SingUpPage(),
  RoutesPaths.home: (BuildContext context) => HomePage(),
  RoutesPaths.search: (BuildContext context) => const SearchPage(),
  RoutesPaths.filter: (BuildContext context) => const FilterPage(),
  RoutesPaths.collections: (BuildContext context) => const CollectionsPage(),
  RoutesPaths.collectionDetail: (BuildContext context) => const CollectionDetailPage(),
  RoutesPaths.placeDetail: (BuildContext context) => const PlaceDetailPage(),
  RoutesPaths.profileDetail: (BuildContext context) => const ProfileDetailPage()
};
