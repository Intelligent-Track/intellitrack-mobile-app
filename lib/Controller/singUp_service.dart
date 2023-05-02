import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intellitrack/Model/environment.dart';


class SingUpService {

  final http.Client request =  http.Client();

  Future<bool> singUp(String username, String password, String name, String email, String phone, String nit, String companyName, String document) async{
    final uri = Uri.http(Environment.apiUrl, Environment.signPath);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'name': name,
      'password': password,
      'phone': phone,
      'nit': nit,
      'companyName': companyName,
      'username': email,
      'document': document,});
    String bodyRep;
    try{
      final response = await http.post(uri, headers: headers, body: body).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    } on Exception{
      throw Exception();
    }

  }
}