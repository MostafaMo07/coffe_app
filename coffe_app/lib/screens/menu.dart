import 'package:coffe_app/screens/shops.dart';
import 'package:coffe_app/services/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

import '../screens/logout.dart';
import '../const.dart';
import './menu_list.dart';

class MenuScreen extends StatefulWidget {
  static String routeName = 'menuScreen';
  static Route<MenuScreen> route() {
    return MaterialPageRoute<MenuScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => MenuScreen(),
    );
  }

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    MenuList(coffees: coffees),
    ShopsScreen(),
    ShopsScreen(),
    LogoutScreen(),
  ];

  final FirebaseAnalyticsObserver observer = AnalyticsService.observer;

  void _sendCurrentTabToAnalytics() {
    final String screeName = '${MenuScreen.routeName}/tab$_selectedIndex';
    observer.analytics.setCurrentScreen(screenName: screeName);
    print('Logged $screeName');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _sendCurrentTabToAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome to the WiredBrain"),
        centerTitle: true,
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.brown.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Shops",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: "Support",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown.shade800,
        onTap: _onItemTapped,
      ),
    );
  }
}
