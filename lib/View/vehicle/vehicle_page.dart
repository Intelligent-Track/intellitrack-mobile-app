import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Model/vehicle.dart';





class vehiclepage extends StatefulWidget {
  @override
  State<vehiclepage> createState() => _vehiclepageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _vehiclepageState extends State<vehiclepage>{

  List<Vehicle> veh = [Vehicle("Tracto Camion", "SDF234", 10000, 100000000),
    Vehicle("Camion", "WDE345", 233000, 1000000),
    Vehicle("Mono Plato", "OPF785", 3200, 200000),
    Vehicle("Camionsito", "VNE567", 300, 552000000),];

  @override
  void initState() {
    super.initState();
  }


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
          title: Text("Vehiculos", style: TextStyle(color: Colors.black),),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
              physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
          ),
          child: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                child: VehiList(context),
            ),
          ),
        )
    );
  }

  Widget VehiList(BuildContext context) =>
      ListView.builder(
          itemCount: veh.length,
          itemBuilder: (context, index) {
            final ve = veh[index];
            return Container(
                child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              Text("Placa: ${ve.Placa}"),
                              Text("Tipo: ${ve.Tipo}")
                            ],
                          ),
                          Column(
                            children: [
                              Text("Capacidad: ${ve.Capacidad}v3"),
                              Text("Km: ${ve.kilometraje}"),
                            ],
                          )
                        ],
                      ),
                    ),
                )
            );
          }
      );


}