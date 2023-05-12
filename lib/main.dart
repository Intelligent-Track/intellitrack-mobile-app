import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intellitrack/Model/environment.dart';

import 'Controller/ValidateRoot_service.dart';
import 'View/ServicesCustomer/ServiceCustomer_page.dart';
import 'View/login/login_page.dart';
import 'View/login/security_page.dart';
import 'View/vehicle/vehicle_page.dart';

Future <void> main() async {
  await dotenv.load(fileName: Environment.filename);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  var root  = await ValidateRootService().ValidateRoot();
  if(!root!){
    runApp(const MyApp());
  }else{
    runApp(const ErrorApp());
  }

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
class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntelliTrack',
      theme: ThemeData(canvasColor: Colors.white, fontFamily: "inellitrackFamily", brightness: Brightness.light),
      home: Securitypage()
    );
  }
}


