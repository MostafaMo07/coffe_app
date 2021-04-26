import 'package:coffe_app/coffe_router.dart';
import 'package:coffe_app/get_theme.dart';
import 'package:coffe_app/screens/splash_screen.dart';
import 'package:coffe_app/services/analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'package:flutter/material.dart';

class CoffeApp extends StatelessWidget {
  final FirebaseAnalyticsObserver observer = AnalyticsService.observer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      navigatorKey: CoffeeRouter.instance.navigatorKey,
      navigatorObservers: <NavigatorObserver>[observer],
      theme: getTheme(),
    );
  }
}
