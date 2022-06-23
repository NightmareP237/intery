
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:interyapp/sreens/statut.dart';
import 'package:interyapp/widgets/config.dart';
import 'package:overlay_support/overlay_support.dart';
import 'coverpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("images/f.jpg"), context);
    precacheImage(const AssetImage("images/frank.png"), context);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, constraints) {
        config().lize;
        return OverlaySupport.global(
         child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body:
          const statut(),
          )
          ),
        );
        });
    });
  }
}