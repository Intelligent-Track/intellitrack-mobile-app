import 'dart:convert';


import 'package:http/http.dart' as http;



import '../../Model/environment.dart';
import '../../Model/warehouse.dart';
import '../Model/city.dart';
import '../Model/type.dart';


  
class WarehouseService {

   // Lista de ciudades que se cargará desde la API
 

  Future<List<Warehouse>> fetchWarehouses() async {
    final ware= Uri.http(Environment.apiUrl,Environment.warehousePath.padRight(Environment.warehousePath.length+1,'/allWarehouses'));
    try {
      final response = await http.get(ware);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Warehouse> fetchedWarehouses = data.map((item) {
        final city = City.fromJson(item['city']);
        final type = Type.fromJson(item['type']);
        return Warehouse(
          item['id'],
          city,
          item['address'],
          item['capacity'].toDouble(),
          type,
          item['costPerM3'].toDouble(),
        );
      }).toList();
      return fetchedWarehouses;
      } else {
        throw Exception('Error al obtener la lista de bodegas'); // Manejar errores de la solicitud HTTP
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
    
}