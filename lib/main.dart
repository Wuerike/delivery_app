import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // design system based on 390x844
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes,
          initialRoute: 'welcome',
          theme: ThemeData(
            primaryColor: orange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
