import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'forgotpaswordStep2_page..dart';


class forgotpassStep1page extends StatefulWidget {
  @override
  State<forgotpassStep1page> createState() => _forgotpassStep1pageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

var correo = TextEditingController();
var pin = TextEditingController();

class _forgotpassStep1pageState extends State<forgotpassStep1page>{

  @override
  void initState() {
    super.initState();
  }
  var  ver = true;
  var enviocorreo = false;

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
          elevation: 1,
          centerTitle: true,
          title: Text("Recuperar Contraseña", style: TextStyle(color: Colors.black),),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
              physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50)),
                  Form(
                    key: formKey,
                    child: enviocorreo?
                    TextFormField(
                      onEditingComplete: (){
                        FocusScope.of(context).nextFocus();
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly // Solo permite dígitos
                      ],
                      controller: pin,
                      cursorColor: Color.fromARGB(255, 63, 65, 78),
                      style: TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        hintText: 'Ingrese Pin',
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
                          return 'Ingrese Pin';
                        }
                        setState(() {
                          ver = true;
                        });
                        return null;
                      },
                    )
                        :TextFormField(
                    onEditingComplete: (){
                      FocusScope.of(context).nextFocus();
                    },
                    controller: correo,
                    cursorColor: Color.fromARGB(255, 63, 65, 78),
                    style: TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 231, 230, 230),
                      hintText: 'Ingrese correo',
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
                  ),),
                  Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50)),
                  enviocorreo?
                  ElevatedButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      forgotpassStep2page())
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        child: Text("Validar PIN", style: TextStyle(fontSize: 17),),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 8, // elevación de la sombra
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                        ),
                        backgroundColor: Color.fromARGB(255, 255, 110, 89), // color de fondo
                      )
                  )
                      :ElevatedButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                            if(enviocorreo){
                              enviocorreo = !enviocorreo;
                            }else{
                              setState(() {
                                enviocorreo = !enviocorreo;
                              });
                            }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        child: Text("Enviar correo", style: TextStyle(fontSize: 17),),
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