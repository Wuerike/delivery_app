import 'package:delivery_app/firebase_options.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            primaryColor: AppColors.orange,
            scaffoldBackgroundColor: AppColors.bgGreyPage,
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
