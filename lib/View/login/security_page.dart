
import 'package:flutter/material.dart';



class Securitypage extends StatefulWidget {
  @override
  State<Securitypage> createState() => _SecuritypageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _SecuritypageState extends State<Securitypage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(child: Center(child: Text("Por nuestras politicas de seguridad no puedes ingresar"),),)
    );
  }
}