import 'package:flutter/material.dart';

import 'furniture.page.dart';
import 'profile.page.dart';

class FurnitureApp extends StatelessWidget {
  static final String path = "lib/src/furniture_app/furniture_app.dart";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: routes,
    );
  }

  Map<String, WidgetBuilder> get routes {
    return {
      '/': (BuildContext context) => ProfilePage(),
      '/furniture': (BuildContext context) => FurniturePage(),
    };
  }
}
