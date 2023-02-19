import 'package:flutter/material.dart';
import 'resources/route_manager.dart';
import 'resources/string_manager.dart';
import 'resources/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appTitle,
      theme: ThemeManager.themeData(),
      initialRoute: Routes.loginRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
