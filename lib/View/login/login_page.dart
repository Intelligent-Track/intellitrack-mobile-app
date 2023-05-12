import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Home/homeCustomerAdmin_page.dart';
import '../Home/homeCustomerRepre_page.dart';
import '../Home/homeDriver_page.dart';
import '../Home/homeManagerGeneral_page.dart';
import '../Home/homeManagerRegional_page.dart';
import '../../Controller/login_service.dart';
import '../forgotpasword/forgotpaswordStep1_page.dart';
import '../quotation/quotation_page.dart';
import '../singup/singup_page.dart';


class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

var correo = TextEditingController();
var contrasena = TextEditingController();
var loginService = LoginService();
var  loading = false;
var  ver = true;

class _LoginpageState extends State<Loginpage>{

  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context){
    return loading? Center(child: CircularProgressIndicator(color: Colors.red,),) :Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
            physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/Icon/logo.png", height: MediaQuery.of(context).size.height/3,),
                        Text("Bienvenido(a) de nuevo",
                          style: TextStyle(color: Color.fromARGB(255, 63, 65, 78)
                              , fontSize: 25,
                              fontWeight: FontWeight.w500),),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50)),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                onEditingComplete: (){
                                  FocusScope.of(context).nextFocus();
                                },
                                controller: correo,
                                cursorColor: Color.fromARGB(255, 63, 65, 78),
                                style: TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 231, 230, 230),
                                  hintText: 'Correo',
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.email_outlined, color: Color.fromARGB(255, 63, 65, 78)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      ver = false;
                                    });
                                    return 'Ingrese Correo';
                                  }
                                  setState(() {
                                    ver = true;
                                  });
                                  return null;
                                },
                              ),
                              ver? Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/60)):Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                              TextFormField(
                                controller: contrasena,
                                obscureText: true,
                                cursorColor: Color.fromARGB(255, 63, 65, 78),
                                style: TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                                decoration: InputDecoration(
                                  hintText: 'Contraseña',
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 231, 230, 230),
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 63, 65, 78)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ingrese Contraseña';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50)),
                        ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                              var rep = await loginService.login(correo.text, contrasena.text);
                              if(rep.estatus){
                                print(rep.message);
                                if(rep.message.contains("ROLE_CONDUCTOR")){
                                  correo.clear();
                                  contrasena.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePageDriverpage(rep.username)),(Route<dynamic> route) => false,
                                  );
                                }
                                if(rep.message.contains("ROLE_GERENTEGEN")){
                                  correo.clear();
                                  contrasena.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeManagerpage(rep.username)),(Route<dynamic> route) => false,
                                  );
                                }
                                if(rep.message.contains("ROLE_GERENTEREG")){
                                  correo.clear();
                                  contrasena.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeManagerRegionalpage(rep.username)),(Route<dynamic> route) => false,
                                  );
                                }
                                if(rep.message.contains("ROLE_CLIENTEADM")){
                                  correo.clear();
                                  contrasena.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeCustomerAdminpage(rep.username)),(Route<dynamic> route) => false,
                                  );
                                }
                                if(rep.message.contains("ROLE_CLIENTEREPRE")){
                                  correo.clear();
                                  contrasena.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeCustomerReprepage(rep.username)),(Route<dynamic> route) => false,
                                  );
                                }
                              }else{
                                setState(() {
                                  loading = false;
                                });
                                Timer(Duration(milliseconds: 100), () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(rep.message),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });

                              }

                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                              child: Text("Iniciar Sesion", style: TextStyle(fontSize: 17),),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 8, // elevación de la sombra
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                              ),
                              backgroundColor: Color.fromARGB(255, 255, 110, 89), // color de fondo
                            )
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      forgotpassStep1page())
                          );
                        }, child:Text("¿Olvido su contraseña? ", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),),style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all<Color>(Colors.grey), // color deseado
                        ))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   QuotationPage())
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿Quieres conocer el precio de un envio sin Ingresar?", style: TextStyle(color: Colors.grey),),
                          Text(" COTIZA", style: TextStyle(color: Color.fromARGB(255, 255, 110, 89)),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingUPpage())
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿Aún no tienes una cuenta?", style: TextStyle(color: Colors.grey),),
                          Text(" REGÍSTRATE", style: TextStyle(color: Color.fromARGB(255, 255, 110, 89)),),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      )
    );
  }
}