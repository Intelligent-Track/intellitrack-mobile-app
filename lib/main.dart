import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intellitrack/Model/environment.dart';

import 'View/login/login_page.dart';

Future <void> main() async {
  await dotenv.load(fileName: Environment.filename);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntelliTrack',
      theme: ThemeData(canvasColor: Colors.white, fontFamily: "inellitrackFamily", brightness: Brightness.light),
      home: Loginpage(),
    );
  }
}

