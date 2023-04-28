import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class forgotpassStep2page extends StatefulWidget {
  @override
  State<forgotpassStep2page> createState() => _forgotpassStep2pageState();
}



class _forgotpassStep2pageState extends State<forgotpassStep2page>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  bool _obscureText = true;
  bool _passwordsMatch = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validatePasswords() {
    if (passwordController.text == confirmPasswordController.text) {
      setState(() {
        _passwordsMatch = true;
      });
    } else {
      setState(() {
        _passwordsMatch = false;
      });
    }
  }

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
          title: Text("Nueva contraseña", style: TextStyle(color: Colors.black),),
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
                  Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    height: MediaQuery.of(context).size.height/3,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(255, 231, 230, 230)
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _obscureText,
                              cursorColor: Color.fromARGB(255, 63, 65, 78),
                              style: TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 231, 230, 230),
                                hintText: 'Contraseña',
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
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Color.fromARGB(255, 63, 65, 78),),
                                  onPressed: _togglePasswordVisibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese una contraseña';
                                }
                                return null;
                              },
                              onChanged: (_) => _validatePasswords(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Color.fromARGB(255, 231, 230, 230)
                            ),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              obscureText: _obscureText,
                              cursorColor: Color.fromARGB(255, 63, 65, 78),
                              style: TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                              decoration: InputDecoration(
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
                                hintText: 'Confirmar Contraseña',
                                suffixIcon: _passwordsMatch
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                                    : Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor confirme la contraseña';
                                } else if (value != passwordController.text) {
                                  return 'Las contraseñas no coinciden';
                                }
                                return null;
                              },
                              onChanged: (_) => _validatePasswords(),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Contraseñas válidas'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                                child: Text("Confirmar", style: TextStyle(fontSize: 17),),
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
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}