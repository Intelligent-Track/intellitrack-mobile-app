import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intellitrack/View/settings/settings_page.dart';


class HomePageDriverpage extends StatefulWidget {
  String username;
  HomePageDriverpage(this.username);
  @override
  State<HomePageDriverpage> createState() => _HomePageDriverpageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _HomePageDriverpageState extends State<HomePageDriverpage>{

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.person_2_outlined,color: Colors.black,),
            onPressed: () {
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Settingspage())
                );
              },
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text("Bienvenido", style: TextStyle(color: Colors.black),),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
              physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height/1.4,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Proxima funcionalidad", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height:  MediaQuery.of(context).size.height/7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/Image/servicioCurso.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Servicio en curso", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Contrato en curso")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Proxima funcionalidad", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height:  MediaQuery.of(context).size.height/7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/Image/infovehiculo.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Informe de vehículo", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Informacion del vehículo \nasignado")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Proxima funcionalidad", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height:  MediaQuery.of(context).size.height/7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/Image/historialServicios.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Historial de servicios", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Listado de servicios realizados")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Proxima funcionalidad", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height:  MediaQuery.of(context).size.height/7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/Image/contratos.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Contratos", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Detalles de nuevos servicios")
                            ],
                          )
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