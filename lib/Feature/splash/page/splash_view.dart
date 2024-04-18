
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/config/pages_route_name.dart';
import '../../../core/widget/custom_background_widget.dart';
import '../../../main.dart';


class SplashView extends StatefulWidget {
   const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {
    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds : 2),(){
      navigatorKey.currentState!.pushReplacementNamed(PageRouteName.homeView);

    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(child: Image.asset("assets/images/logo.png"));
  }
}
