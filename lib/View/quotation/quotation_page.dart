import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:http/http.dart' as http;

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../Controller/quotation_service.dart';

import '../../Model/environment.dart';

var quotationService = QuotationService();
var  loading = false;

class QuotationPage extends StatefulWidget {
  const QuotationPage({Key? key}) : super(key: key);

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _originCityController = TextEditingController();
  final TextEditingController _destinationCityController = TextEditingController();
  final TextEditingController _shipmentTypeController = TextEditingController();
  final TextEditingController _departureDateController = TextEditingController();
  final TextEditingController _arrivalDateController = TextEditingController();
  final TextEditingController _shipmentDimensionsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  List<City>? cities; // Lista de ciudades que se cargará desde la API
  City? _originCity;
  City? _destinationCity;
  Quotation? q;
  double? _valor;

  @override
  void initState() {
    super.initState();
    loading = false;
    fetchCities(); // Llamar a la función para obtener las ciudades
  }

  Future<void> fetchCities() async {
    final ware= Uri.http(Environment.apiUrl,Environment.quoutationPath.padRight(Environment.quoutationPath.length+1,'/allCities'));
    try {
      final response = await http.get(ware); // Cambie "https://su-api-ciudades/ciudades" por la URL correcta de su API
      if (response.statusCode == 200) {
        final List<dynamic> citiesJson = jsonDecode(response.body);
        final List<City> _cities = citiesJson.map((json) => City.fromJson(json)).toList(); // Convertir la lista de JSON en una lista de objetos City
        setState(() {
          cities = _cities; // Almacenar la lista de ciudades en el estado de QuotationPage
        });
      } else {
        throw Exception('Error al obtener la lista de ciudades'); // Manejar errores de la solicitud HTTP
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return loading? Center(child: CircularProgressIndicator(color: Colors.red,),):Scaffold(
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
        title: const Text('Cotización', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField<City>(
                  value: _originCity,
                  items: cities?.map((city) {
                    return DropdownMenuItem<City>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Ciudad de origen',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, seleccione la ciudad de origen';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _originCity = value;
                      _originCityController.text = value!.name;
                    });
                  },
                ),

                DropdownButtonFormField<City>(
                  value: _destinationCity,
                  items: cities?.map((city) {
                    return DropdownMenuItem<City>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Ciudad de destino',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, seleccione la ciudad de destino';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _destinationCity=value;  
                      _destinationCityController.text = value!.name;
                    });
                  },
                ),
                TextFormField(
                  controller: _shipmentTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de envío',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese el tipo de envío';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _departureDateController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de salida',
                  ),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2050, 12, 31),
                        onConfirm: (date) {
                      _departureDateController.text = date.toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, seleccione la fecha de salida';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _arrivalDateController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de llegada',
                  ),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2050, 12, 31),
                        onConfirm: (date) {
                      _arrivalDateController.text = date.toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, seleccione la fecha de llegada';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shipmentDimensionsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Dimensiones del envío',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese las dimensiones en m3 del envío';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Peso del envio (Ton)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese el peso en toneladas del envío';
                    }
                    return null;
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50)),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Quotation q = Quotation(
                          _shipmentTypeController.text,
                          _originCity!,
                          _destinationCity!,
                          int.parse(_weightController.text),
                          int.parse(_shipmentDimensionsController.text),
                          _arrivalDateController.text,
                          _departureDateController.text);
                        _valor= await quotationService.showQuotationResult(q);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Cotización'),
                              content: Text('El precio de la cotización es de: $_valor '),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cerrar', style: TextStyle(color: Color.fromARGB(255, 255, 110, 89)),),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          child: Text("Cotizar", style: TextStyle(fontSize: 17),),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 8, // elevación de la sombra
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // radio de la esquina redondeada
                          ),
                          backgroundColor: Color.fromARGB(255, 255, 110, 89), // color de fondo
                        )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}





  
