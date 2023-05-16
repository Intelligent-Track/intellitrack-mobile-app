import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intellitrack/Model/responseEditDelivery.dart';
import '../Model/delivery.dart';
import '../Model/environment.dart';


class DeleteDeliveryService {

  final http.Client request =  http.Client();

  Future<ResponseEditDelivery> deleteDelivery(String id) async{
    final uri = Uri.http(Environment.apiUrl, Environment.deleteDeliveryPath + id);
    print (uri);
    try{
      final response = await http.delete(uri).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 200){
        if(response.body == "Envío con id ha sido borrado con exito!"){
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