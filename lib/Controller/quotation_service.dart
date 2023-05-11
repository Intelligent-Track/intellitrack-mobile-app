import 'dart:convert';


import 'package:http/http.dart' as http;



import '../../Model/environment.dart';

class City {
  final int id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Quotation{
 final String loadType;
 final City originCity;
 final City destinationCity;
 final int weight;
 final int volume;
 final String dateArrive;
 final String dateDeparture;

  Quotation(this.loadType, this.originCity, this.destinationCity, this.weight, this.volume, this.dateArrive, this.dateDeparture);
}
  
class QuotationService {

   // Lista de ciudades que se cargará desde la API
 

  Future<List<City>?> fetchCities() async {
    final ware= Uri.http(Environment.apiUrl,Environment.quoutationPath.padRight(Environment.quoutationPath.length+1,'/allCities'));
    try {
      final response = await http.get(ware); // Cambie "https://su-api-ciudades/ciudades" por la URL correcta de su API
      if (response.statusCode == 200) {
        final List<dynamic> citiesJson = jsonDecode(response.body);
        final List<City> cities = citiesJson.map((json) => City.fromJson(json)).toList(); // Convertir la lista de JSON en una lista de objetos City
        return cities; // Almacenar la lista de ciudades en el estado de QuotationPage
  
      } else {
        throw Exception('Error al obtener la lista de ciudades'); // Manejar errores de la solicitud HTTP
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
  Future<double>  showQuotationResult(Quotation q) async {
  // Obtener la cotización
  
      
  final Uri uri =  Uri.http(Environment.apiUrl,Environment.quoutationPath.padRight(Environment.quoutationPath.length+1,'/quoteDelivery'));
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'loadType': q.loadType,
    'originCity': {
      'id': q.originCity.id,
      'name': q.originCity.name,
    },
    'destinationCity': {
      'id': q.destinationCity.id,
      'name': q.destinationCity.name,
    },
    'weight': q.weight,
    'volume': q.volume,
    'dateArrive': q.dateArrive,
    'dateDeparture': q.dateDeparture,
  });
  print(body);
  try {
    final response = await http.post(uri, headers: headers, body: body).timeout(Duration(seconds: 10));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final double price = double.parse(response.body); // Convertir la respuesta del backend de cadena a double
      return price;
    } else {
      print(response.statusCode);
      throw Exception('Error al obtener el precio de la entrega');
    }
  } catch (e) {
    print(e);
    throw Exception('Error al obtener el precio de la entrega');
  }
  
}
    
}
