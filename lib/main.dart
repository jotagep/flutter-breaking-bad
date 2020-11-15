import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breaking_bad/locator.dart';
import 'package:flutter_breaking_bad/pages/home_page.dart';
import 'package:flutter_breaking_bad/viewmodel/home_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Breaking Bad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeModel(),
        child: HomePage()
      ),
    );
  }
}
