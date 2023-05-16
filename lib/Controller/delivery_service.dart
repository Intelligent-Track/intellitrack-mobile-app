import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/delivery.dart';
import '../Model/environment.dart';


class DeliveryService {

  final http.Client request =  http.Client();

  Future<List<Delivery>> deliveryByNit(String nit) async{
    final uri = Uri.http(Environment.apiUrl, Environment.deliverybyNit + nit);
    print (uri);
    try{
      final response = await http.get(uri).timeout(Duration(seconds: 10));
      print(response.statusCode);
      List<Delivery> delys = [];
      if(response.statusCode == 200){
        var bodyRep = jsonDecode(response.body) as List;
        delys = bodyRep.map((del) {
          var prueba = Delivery(del['id'], del['origin'], del['destination'], del['departureDate'], del['arriveDate'], del['costPerTon'], del['travelCost'], del['status'], del['type'], del['idDriver'], del['nit'], del['comments'] != null?del['comments']:"",
              (del['products'] as List).map((pro) {
                var product = Product(pro['id'], pro['category'], pro['weight'], pro['volume'], pro['name']);
                return product;
              }).toList());
          print(prueba.arriveDate);
          return prueba;
        }).toList();
        print(delys.first.arriveDate);
        return delys;
      }else{
        return [];
      }
    } catch(ex){
      print(ex);
      return [];
    }

  }
}