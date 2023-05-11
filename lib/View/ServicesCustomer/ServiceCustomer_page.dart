import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Controller/delivery_service.dart';
import '../../Model/delivery.dart';



class ServiceCustomerpage extends StatefulWidget {
  @override
  State<ServiceCustomerpage> createState() => _ServiceCustomerpageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _ServiceCustomerpageState extends State<ServiceCustomerpage>{
  var buscar = TextEditingController();
  List<Delivery> delys = [];
  List<Delivery> busqueda = [];
  bool filtro = false;
  List<bool> _buttonStates = [false, false, false];
  bool week = false;
  bool mont = false;
  bool year = false;


  @override
  void initState() {
    super.initState();
    DeliveryService().deliveryByNit("10122012334-8").then((deliverys) {
      setState(() {
        delys = deliverys;
        busqueda = deliverys;
      });
    });
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
          title: Text("Servicios", style: TextStyle(color: Colors.black),),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
              physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
          ),
          child: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width/1.5,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ]
                          ),
                          child: TextField(
                            onChanged: (text){
                              if(text.isEmpty){
                                setState(() {
                                  delys = busqueda;
                                });
                              }else{
                                setState(() {
                                  delys = delys.where((element) => element.destination.contains(text) || element.destination.toLowerCase().contains(text) || element.origin.contains(text) || element.origin.toLowerCase().contains(text) || element.type.toLowerCase().contains(text) || element.type.contains(text)).toList();
                                });
                              }
                            },
                            controller: buscar,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 243, 243, 243),
                                hintText: 'Buscar..',
                                hintStyle: TextStyle(
                                    color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Container( padding: EdgeInsets.all(10),child: Icon(Icons.search, color: Colors.black,),)
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 243, 243),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IconButton(icon: Icon(Icons.filter_alt_rounded, color: Colors.black,),
                              onPressed: () {
                                  setState(() {
                                    filtro = !filtro;
                                  });
                              }
                          ),
                        )
                      ],
                    ),
                    filtro? Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child:  Container(
                      padding: EdgeInsets.all(10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width/1.2,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height/6,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 243, 243),
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ]
                        ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Filtro", style: TextStyle(fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                              onTap: () {
                              setState(() {
                                week = !week;
                                year = false;
                                mont = false;
                              });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height /20,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: week
                                      ? Color.fromARGB(255, 143, 143, 143)
                                      :Color.fromARGB(255, 197, 197, 197),
                                ),
                                child: Row(
                                  children: [
                                    Text("Última semana", style: TextStyle(fontSize: MediaQuery.of(context).size.height /60),),
                                    week ? Icon(Icons.check, size:  MediaQuery.of(context).size.height /40,) : SizedBox(),
                                  ],
                                ),
                              ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                     mont= !mont;
                                     week = false;
                                     year = false;
                                  });
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height /20,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: mont
                                        ? Color.fromARGB(255, 143, 143, 143)
                                        :Color.fromARGB(255, 197, 197, 197),
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Último Mes", style: TextStyle(fontSize: MediaQuery.of(context).size.height /60),),
                                      mont ? Icon(Icons.check, size:  MediaQuery.of(context).size.height /40,) : SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    year = !year;
                                    week = false;
                                    mont = false;
                                  });
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height /20,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: year
                                        ? Color.fromARGB(255, 143, 143, 143)
                                        :Color.fromARGB(255, 197, 197, 197),
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Último año", style: TextStyle(fontSize: MediaQuery.of(context).size.height /60),),
                                      year ? Icon(Icons.check, size:  MediaQuery.of(context).size.height /40,) : SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                        if(week){
                                          setState(() {
                                            delys = delys.where((d) => DateTime.now().difference(DateTime.parse( d.departureDate.toString())).inDays <= 7 ).toList();
                                          });
                                        }
                                        if(mont){
                                          setState(() {
                                            delys = delys.where((d) => DateTime.now().difference(DateTime.parse( d.departureDate.toString())).inDays <= 30 ).toList();
                                          });
                                        }
                                        if(year){
                                          setState(() {
                                            delys = delys.where((d) => DateTime.now().difference(DateTime.parse( d.departureDate.toString())).inDays <= 360 ).toList();
                                          });
                                        }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                                    child: Text("Aplicar", style: TextStyle(fontSize: 10),),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 8, // elevación de la sombra
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                                    ),
                                    backgroundColor: Color.fromARGB(255, 255, 110, 89), // color de fondo
                                  )
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                      setState(() {
                                        week = false;
                                        mont = false;
                                        year = false;
                                        delys = busqueda;
                                      });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                                    child: Text("limpiar", style: TextStyle(fontSize: 10),),
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
                          )
                        ],
                      ),
                    ),):Container(),
                    ScrollConfiguration(
                      behavior: const ScrollBehavior().copyWith(
                          physics: BouncingScrollPhysics() // Establecer el color de la animación de desplazamiento
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height:  MediaQuery.of(context).size.height/1.2,
                          width: MediaQuery.of(context).size.width,
                          child: Services(context),
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

  Widget Services(BuildContext context) =>
      ListView.builder(
          itemCount: delys.length,
          itemBuilder: (context, index) {
            final dal = delys[index];
            return Container(
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: index != delys.length -1?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tipo de envio: ${dal.type}", style: TextStyle(fontWeight: FontWeight.w700),),
                              Text("${dal.origin}-${dal.destination}", style: TextStyle(fontWeight: FontWeight.w100),)
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(dal.status),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                              Icon(Icons.circle_outlined, color: Colors.green,)
                            ],
                          ),
                        )
                      ],
                    ),Container(
                      height: 0.5,
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                    )],
                  ):Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tipo de envio: ${dal.type}", style: TextStyle(fontWeight: FontWeight.w700),),
                            Text("${dal.origin}-${dal.destination}")
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(dal.status),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            Icon(Icons.circle_outlined, color: Colors.green,)
                          ],
                        ),
                      )
                    ],
                  )
                )
            );
          }
      );

}