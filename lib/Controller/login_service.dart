import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Model/environment.dart';

class LoginService {

  final http.Client request =  http.Client();

  Future<String> login(String email, String password) async{
    final uri = Uri.http(Environment.apiUrl, Environment.loginPath);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'username': email, 'password': password});
    String bodyRep;
    try{
      final response = await http.post(uri, headers: headers, body: body).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 200){
        bodyRep = jsonDecode(response.body)['status'] as String;
        return bodyRep;
      }else{
        throw HttpException(response.body);
      }
    } on Exception{
      throw Exception();
    }

  }
}