import 'package:flutter/material.dart';

import 'core/pages/about.page.dart';
import 'core/pages/home.page.dart';
import 'startup.page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // https://stackoverflow.com/questions/44004451/navigator-operation-requested-with-a-context-that-does-not-include-a-navigator
  final _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UIs',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.red,
        accentColor: Colors.indigo,
      ),
      home: StartupPage(),
      navigatorKey: _navKey,
      routes: {
        // "auth_home": (_) => AuthHomePage(),
        "challenge_home": (_) => HomePage(),
        "about": (_) => AboutPage(),
        // "signup": (_) => SignupPage(),
        // "profile": (_) => ProfilePage(),
      },
    );
  }
}
