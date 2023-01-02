import 'package:delivery_app/src/pages/forgot_password_page.dart';
import 'package:delivery_app/src/pages/login_page.dart';
import 'package:delivery_app/src/pages/sign_up_page.dart';
import 'package:delivery_app/src/tabs/tabs_page.dart';
import 'package:flutter/widgets.dart';

// Pages
import 'package:delivery_app/src/pages/welcome_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => ForgotPasswordPage(),
  'sign-up': (BuildContext context) => SingUpPage(),
  'tabs': (BuildContext context) => TabsPage()
};
