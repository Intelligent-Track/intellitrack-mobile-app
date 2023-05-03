import 'package:flutter/material.dart';
import 'package:intellitrack/View/login/login_page.dart';


class Settingspage extends StatefulWidget {
  @override
  State<Settingspage> createState() => _SettingspageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _SettingspageState extends State<Settingspage>{

  @override
  void initState() {
    super.initState();
  }

  Future<void> showMyPopupLogout(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context){
        return  Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width/3,
            height: MediaQuery.of(context).size.height/1.3,
            color: Colors.transparent,
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width/1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(-5, 6),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("¿Esta seguro de cerrar su sesión?", style: TextStyle(fontSize: 17),),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 8, // elevación de la sombra
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                                    ),
                                    backgroundColor: const Color.fromARGB(255, 255, 110, 89), // color de fondo
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    child: const Text("Cancelar", style: TextStyle(fontSize: 17),),
                                  )
                                ),
                                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Loginpage())
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 8, // elevación de la sombra
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                                      ),
                                      backgroundColor: const Color.fromARGB(255, 255, 110, 89), // color de fondo
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: const Text("Aceptar", style: TextStyle(fontSize: 17),),
                                    )
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ]
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: const Text("Configuraciones", style: TextStyle(color: Colors.black),),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
          ),
          child: SingleChildScrollView(
            child: Container(
              height: null,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 243, 243, 243),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black45,
                            width: 1.0,
                          )
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.info_outline_rounded, color: Colors.black, size: 38,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Text("Acerca de IntelliTrack", style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height:  70,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 243, 243, 243),
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 1.0,
                            )
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.lock_outline, color: Colors.black, size: 38,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Text("Privacidad", style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height:  70,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 243, 243, 243),
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 1.0,
                            )
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.info_outline_rounded, color: Colors.black, size: 38,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Text("Términos y condiciones", style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      showMyPopupLogout(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height:  70,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 243, 243, 243),
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 1.0,
                            )
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.logout_outlined, color: Colors.black, size: 38,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Text("Cerrar sesión", style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}