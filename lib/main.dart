import 'package:delivery_app/firebase_options.dart';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/error_state_provider.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
        ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
      ],
      child: MyAppInitialState(),
    );
  }
}

class MyAppInitialState extends StatelessWidget with BaseView {
  MyAppInitialState({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Check if user is logged and defines the initial page
      future: coordinator.start(),
      // Shows a loading page until the future completes
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyApp(initialRoute: snapshot.data!);
        } else {
          // TODO: Add a splash screen
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: loadingView,
          );
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({super.key, required this.initialRoute});

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
          initialRoute: initialRoute,
          theme: ThemeData(
            primaryColor: AppColors.orange,
            scaffoldBackgroundColor: AppColors.bgGreyPage,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
        );
      },
    );
  }
}
