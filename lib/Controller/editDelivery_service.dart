import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intellitrack/Model/responseEditDelivery.dart';
import '../Model/delivery.dart';
import '../Model/environment.dart';


class EditDeliveryService {

  final http.Client request =  http.Client();

  Future<ResponseEditDelivery> editDelivery(Delivery delivery) async{
    final uri = Uri.http(Environment.apiUrl, Environment.editDeliveryPath);
    print (uri);
    try{
      final response = await http.put(
          uri,
        headers: {'Content-Type ': 'application/json'},
        body: json.encode(delivery.toJson())
      ).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 200){
        if(response.body == "Envio actualizada con exito!!"){
          return ResponseEditDelivery(true, response.body);
        }
        return ResponseEditDelivery(false, response.body);
      }else{
        return ResponseEditDelivery(false, response.body);
      }
    } catch(ex){
      print(ex);
      return ResponseEditDelivery(false, "Ocurrio un error");
    }

  }
}