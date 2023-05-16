import 'package:flutter/material.dart';
import 'package:intellitrack/Controller/editDelivery_service.dart';
import 'package:intellitrack/View/ServicesCustomer/ServiceCustomer_page.dart';
import '../../Controller/deleteDelivery_service.dart';
import '../../Controller/delivery_service.dart';

import '../../Model/delivery.dart';

class InfoServicepage extends StatefulWidget {
  String username;
  Delivery delivery;
  InfoServicepage(this.username, this.delivery);
  @override
  State<InfoServicepage> createState() => _InfoServicepageState();
}

var infoAdicionalCtrl = TextEditingController();

class _InfoServicepageState extends State<InfoServicepage>{

  void pushUp (String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child:  Text(
              mensaje,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
    );
  }

  Future<void> showMyPopupCancel(BuildContext context) async {
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
                            const Text("¿Esta seguro de cancelar el servicio?", style: TextStyle(fontSize: 17),),
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
                                      child: const Text("Atras", style: TextStyle(fontSize: 17),),
                                    )
                                ),
                                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                ElevatedButton(
                                    onPressed: () async {
                                      var response = await DeleteDeliveryService().deleteDelivery(widget.delivery.id.toString());
                                      if(response.estatus){
                                        pushUp(response.message);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ServiceCustomerpage(widget.username))
                                        );
                                      } else {
                                        pushUp(response.message);
                                      }
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
  void initState() {

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Image(
                image: AssetImage('assets/Image/operator.png'),
                height: 50,
                width: 50,
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: const Text("Progreso envio", style: TextStyle(color: Colors.black)),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    margin: const EdgeInsets.only(right: 12.0, left: 12.0, top: 60, bottom: 80),
                    child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 55,
                              left: 16,
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: const BoxDecoration(
                                    color : Color.fromRGBO(0, 191, 99, 1),
                                    borderRadius : BorderRadius.all(Radius.elliptical(34, 34)),
                                  )
                              )
                          ),Positioned(
                              top: 55,
                              left: 315,
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: const BoxDecoration(
                                    color : Color.fromRGBO(255, 110, 89, 1),
                                    borderRadius : BorderRadius.all(Radius.elliptical(34, 34)),
                                  )
                              )
                          ),Positioned(
                              top: 0,
                              left: 11,
                              child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: const BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(7),
                                      topRight: Radius.circular(7),
                                      bottomLeft: Radius.circular(7),
                                      bottomRight: Radius.circular(7),
                                    ),
                                    image : DecorationImage(
                                        image: AssetImage('assets/Image/Boxtruck.png'),
                                        fit: BoxFit.fitWidth
                                    ),
                                  )
                              )
                          ),Positioned(
                              top: 72,
                              left: 50,
                              child: Container(
                               width: 265,
                                height: 2,
                                  decoration: const BoxDecoration(
                                    color : Color.fromRGBO(0, 0, 0, 1),
                                  )
                              )
                          ),Positioned(
                              top: 61,
                              left: 179,
                              child: Container(
                                  width: 24,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                    color : Color.fromRGBO(2, 2, 2, 1),
                                    borderRadius : BorderRadius.all(Radius.elliptical(24, 23)),
                                  )
                              )
                          ),const Positioned(
                              top: 88,
                              left: 159,
                              child: Text('En camino', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                              ),)
                          ),const Positioned(
                              top: 88,
                              left: 2,
                              child: Text('Recogido', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                              ),)
                          ),const Positioned(
                              top: 88,
                              left: 305,
                              child: Text('Finalizado', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                              ),)
                          ),Positioned(
                              top: 108,
                              left: 295,
                              child: Text(widget.delivery.arriveDate, textAlign: TextAlign.left, style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Montserrat',
                                  fontSize: 10,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),)
                          ),Positioned(
                              top: 108,
                              left: 0,
                              child: Text(widget.delivery.departureDate, textAlign: TextAlign.left, style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Montserrat',
                                  fontSize: 10,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),)
                          ),
                        ]
                    )
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(244, 244, 244, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          border:Border.all(
                            color: const Color.fromRGBO(0, 191, 99, 1),
                            width: 2.0
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20)
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7),
                                  ),
                                  image : DecorationImage(
                                      image: AssetImage('assets/Image/Boxtruck.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                )
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('450.000', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                Text('Hasta 500 kg', style: TextStyle(color: Colors.black),),
                              ],
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
                
              ],
            )
        ),
        bottomSheet: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 243, 243, 243),
                        width: 2
                      )
                    ),
                  ),
                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 40,
                            left: 0,
                            child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color : Color.fromRGBO(255, 110, 89, 1),
                                  borderRadius : BorderRadius.all(Radius.elliptical(8, 8)),
                                )
                            )
                        ),
                        const Positioned(
                            top: 0,
                            left: 18,
                            child: Text('Ubicación actual', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 0.5),
                                fontFamily: 'Montserrat',
                                fontSize: 9,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),const Positioned(
                            top: 40,
                            left: 14,
                            child: Text('Localización de envío', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 0.5),
                                fontFamily: 'Montserrat',
                                fontSize: 9,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),Positioned(
                            top: 1,
                            left: 0,
                            child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color : Color.fromRGBO(0, 191, 99, 1),
                                  borderRadius : BorderRadius.all(Radius.elliptical(8, 8)),
                                )
                            )
                        ),const Positioned(
                            top: 10,
                            left: 17,
                            child: Text('Cota -Cundinamarca', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),Positioned(
                            top: 55,
                            left: 14,
                            child: Text(widget.delivery.destination, textAlign: TextAlign.left, style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),
                      ]
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 243, 243, 243),
                          width: 2
                      )
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '¿Deseas agregar un comentario adicional?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/120)),
                    TextFormField(
                      controller: infoAdicionalCtrl,
                      cursorColor: const Color.fromARGB(255, 63, 65, 78),
                      style: const TextStyle(color: Color.fromARGB(255, 63, 65, 78), fontSize: 17),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 231, 230, 230),
                        hintText: 'Coméntanos...',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 63, 65, 78)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15),
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
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          showMyPopupCancel(context);
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
                          child: const Text("Cancelar envío", style: TextStyle(fontSize: 17),),
                        )
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                        onPressed: () async {
                          widget.delivery.comments = infoAdicionalCtrl.text.toString();
                          var response = await EditDeliveryService().editDelivery(widget.delivery);
                          if(response.estatus){
                            pushUp(response.message);
                            Navigator.pop(context);
                          } else {
                            pushUp(response.message);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 8, // elevación de la sombra
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                          ),
                          backgroundColor: const Color.fromARGB(255, 0, 191, 99), // color de fondo
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: const Text("Guardar", style: TextStyle(fontSize: 17),),
                        )
                    ),
                  ],
                ),
              )
            ],
          )
        ),
    );
  }
}