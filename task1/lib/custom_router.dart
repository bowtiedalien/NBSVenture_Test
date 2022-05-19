import 'package:flutter/material.dart';
import 'package:task1/main.dart';
import 'package:task1/screens/second_screen.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => MyHomePage(title: "Business Name"));
      case secondPage:
        return MaterialPageRoute(builder: (_) => SecondScreen());
    }
    // default behaviour if page does not exist
    return MaterialPageRoute(
        builder: (_) => MyHomePage(title: "Business Name"));
  }
}

const String homeRoute = '/';
const String secondPage = '/secondpage';
