import 'package:flutter/material.dart';
import 'package:manoj_krishna/android/landing_page_android.dart';
import 'package:manoj_krishna/web/landing_page_web.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return LandingPageWeb();
          } else {
            return LandingPageAndroid();
          }
        },
      ),
    );
  }
}
