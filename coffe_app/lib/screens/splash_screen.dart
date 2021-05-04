import 'package:coffe_app/coffe_router.dart';
import 'package:coffe_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  static String routeName = 'splashScreen';
  static Route<SplashScreen> route() {
    return MaterialPageRoute<SplashScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => SplashScreen(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/coffeback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 600),
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        if (_authService.currentUser != null) {
          CoffeeRouter.instance.push(HomeScreen.route());
        } else {
          CoffeeRouter.instance.push(HomeScreen.route());
        }
      },
    );
  }
}
