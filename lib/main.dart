import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:get/get.dart';

import 'app/ApiService/BinderData.dart';
import 'app/AppTheme/Theme.dart';
import 'app/routes/app_pages.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  Gemini.init(apiKey:'AIzaSyCTrq-spWYNva2Zftw2WDA4lHqn-7yGRTA');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppTheme.scaffoldBackgroundColor,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      theme: AppTheme.getThemeData,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: BinderData(),
    ),
  );
}
