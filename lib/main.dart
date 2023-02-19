import 'package:flutter/material.dart';
import 'resources/route_manager.dart';
import 'resources/string_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appTitle,
      initialRoute: Routes.loginRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
