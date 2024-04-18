import 'package:flutter/material.dart';

import 'Feature/splash/page/splash_view.dart';
import 'core/config/app_theme_manager.dart';
import 'core/config/pages_route_name.dart';
import 'core/config/routs.dart';


GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news App',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      themeMode: ThemeMode.light,
      home: SplashView(),
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.onGeneratedRoutes,
      navigatorKey: navigatorKey ,
    );
  }
}


