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

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelcomePage(),
  'sign-in': (BuildContext context) => SignInPage(),
  'update-password': (BuildContext context) => UpdatePasswordPage(),
  'sign-up': (BuildContext context) => SingUpPage(),
  'home': (BuildContext context) => HomePage(),
  'search': (BuildContext context) => const SearchPage(),
  'filter': (BuildContext context) => const FilterPage(),
  'collections': (BuildContext context) => const CollectionsPage(),
  'collection-detail': (BuildContext context) => const CollectionDetailPage(),
  'place-detail': (BuildContext context) => const PlaceDetailPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage()
};
