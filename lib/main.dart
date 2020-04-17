import 'package:covid19monitoring/data/provider/countries_provider.dart';
import 'package:covid19monitoring/data/provider/global_provider.dart';
import 'package:covid19monitoring/ui/animation/page_transition.dart';
import 'package:covid19monitoring/ui/page/detail_page.dart';
import 'package:covid19monitoring/ui/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => GlobalProvider()),
  ],
  child: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<GlobalProvider>(
            create: (context) => GlobalProvider(),
          ),
          ChangeNotifierProvider<CountriesProvider>(
            create: (context) => CountriesProvider(),
          )
        ],
        child: MainPage(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
              child: DetailPage(),
              type: PageTransitionType.scale,
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}
