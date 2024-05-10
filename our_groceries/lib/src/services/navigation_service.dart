import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void showMyDialog() {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => const Center(
              child: Material(
                color: Colors.transparent,
                child: Text('Hello'),
              ),
            ));
  }
}
