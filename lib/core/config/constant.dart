import 'package:flutter/material.dart';


import '../../main.dart';

class Constants{
static var theme = Theme.of(navigatorKey.currentState!.context);
static var mediaQuery=MediaQuery.of(navigatorKey.currentState!.context).size;
static const String apiKey="85b30bdde0a14403b430c4f1227edb4b";//"00d5e5241900400aaf595617b7596bd3"
static const String baseUrl= "newsapi.org";
static const String endpoint= "/v2/top-headlines/sources";
////
}