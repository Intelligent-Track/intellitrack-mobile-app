import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingUPpage extends StatefulWidget {
  @override
  State<SingUPpage> createState() => _SingUPpageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

var correo = TextEditingController();
var pin = TextEditingController();

class _SingUPpageState extends State<SingUPpage>{

  @override
  void initState() {
    super.initState();
  }
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController telefonoCtrl = TextEditingController();
  final TextEditingController cargoCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  final TextEditingController empresaDescripcionCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController nitCtrl = TextEditingController();
  final TextEditingController empresaNombreCtrl = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
              physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/10,
                    width: MediaQuery.of(context).size.height/10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Icon/logo.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                  ),
                  Text("Regístrate",
                    style: TextStyle(color: Color.fromARGB(255, 63, 65, 78)
                        , fontSize: 30,
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
                          controller: nombreCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Nombre',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un nombre válido';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: telefonoCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Número telefónico',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un número telefónico válido';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: cargoCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Cargo en la empresa',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un cargo válido';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: passwordCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Contraseña',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese una contraseña válida';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: confirmPasswordCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Confirmar contraseña',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirme su contraseña';
                            }
                            if (value != passwordCtrl.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: empresaDescripcionCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Descripción de la empresa',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese una descripción válida';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: emailCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Correo electrónico',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un correo válido';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: nitCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'NIT de la empresa',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un NIT válido';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/95)),
                        TextFormField(
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: empresaNombreCtrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 230, 230),
                            hintStyle: TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                            contentPadding: EdgeInsets.all(5),
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
                            hintText: 'Nombre de la empresa',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un nombre de empresa válido';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50)),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {

                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        child: Text("Registrarse", style: TextStyle(fontSize: 17),),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 8, // elevación de la sombra
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                        ),
                        backgroundColor: Color.fromARGB(255, 255, 110, 89), // color de fondo
                      )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}