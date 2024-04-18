import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/core/config/pages_route_name.dart';

import '../../Feature/home/page/home_view.dart';
import '../../Feature/settings/page/settings_view.dart';
import '../../Feature/splash/page/splash_view.dart';


class Routes {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings){
    switch (settings.name){
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => SplashView(),settings: settings);
      case PageRouteName.homeView:
        return MaterialPageRoute(builder: (context) => HomeView());
      case PageRouteName.SettingView:
        return MaterialPageRoute(builder: (context) => SettingView());

      default:
        return MaterialPageRoute(builder: (context) =>SplashView());
    }

  }
}