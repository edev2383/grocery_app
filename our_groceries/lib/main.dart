import 'package:flutter/material.dart';
import 'package:our_groceries/src/routes/routes.dart';
import 'package:our_groceries/src/services/navigation_service.dart';
import 'package:our_groceries/src/startup/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Groceries',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 160, 183)),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
