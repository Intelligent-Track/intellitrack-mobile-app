import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'Routing.dart';



class SingUpService {

  final http.Client request =  http.Client();

  Future<bool> SingUp( String username, String password, String name, String email, String phone, String nit, String companyName, String document) async{
    final uri = Uri.http(Routing().url_api,Routing().singUp);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'name': name,
      'password': password,
      'username': username,
      'phone': phone,
      'nit': nit,
      'companyName': companyName,
      'username': email,
      'document': document,});
    String bodyRep;
    try{
      final response = await http.post(uri, headers: headers, body: body).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 201){
        return true;
      }else{
        throw HttpException(response.body);
      }
    } on Exception{
      throw Exception();
    }

  }
}