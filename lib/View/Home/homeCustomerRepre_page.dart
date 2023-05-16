import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ServicesCustomer/ServiceCustomer_page.dart';
import '../settings/settings_page.dart';
import '../vehicle/vehicle_page.dart';


class HomeCustomerReprepage extends StatefulWidget {
  String username;
  HomeCustomerReprepage(this.username);
  @override
  State<HomeCustomerReprepage> createState() => _HomeCustomerReprepageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _HomeCustomerReprepageState extends State<HomeCustomerReprepage>{

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
                            Image.asset("assets/Image/bodegas.png"),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ver lista de bodegas", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                                Text("Bodegas que tiene contratado")
                              ],
                            )
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
                                    ServiceCustomerpage(widget.username))
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
                                Text("Servicios contratados", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                                Text("Envíos que estan en curso")
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
                            Image.asset("assets/Image/notepad.png"),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Servicio de transporte", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                                Text("Listado de servicio de \ntransporte contratado")
                              ],
                            )
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
                                    vehiclepage())
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
                                Text("Informe de vehículos", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
                                Text("Informacion del vehículo \nregistrados")
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}