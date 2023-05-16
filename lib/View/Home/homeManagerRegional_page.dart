import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../settings/settings_page.dart';
import '../warehouse/warehouse_page.dart';


class HomeManagerRegionalpage extends StatefulWidget {
  String username;
  HomeManagerRegionalpage(this.username);
  @override
  State<HomeManagerRegionalpage> createState() => _HomeManagerpageRegionalState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _HomeManagerpageRegionalState extends State<HomeManagerRegionalpage>{

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
              height: MediaQuery.of(context).size.height/1.8,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   WarehouseListPage())
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
                          Image.asset("assets/Image/bodegas.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ver lista de bodegas", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Bodegas que tiene a su cargo")
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
                          Image.asset("assets/Image/tracking.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Servicios a cargo", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Listado de servicios activos")
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
                          Image.asset("assets/Image/trabajadores.png"),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lista de trabajadores", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                              Text("Listado de trabajadores \npor la región")
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