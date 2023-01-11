import 'package:delivery_app/src/features/presentation/forgot_password_page/view/forgot_password_page.dart';
import 'package:delivery_app/src/features/presentation/login_page/view/login_page.dart';
import 'package:delivery_app/src/features/presentation/search_page/view/search_page.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/view/sign_up_page.dart';
import 'package:delivery_app/src/features/presentation/tabs/tabs_page.dart';
import 'package:delivery_app/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => ForgotPasswordPage(),
  'sign-up': (BuildContext context) => SingUpPage(),
  'tabs': (BuildContext context) => TabsPage(),
  'search': (BuildContext context) => SearchPage()
};
