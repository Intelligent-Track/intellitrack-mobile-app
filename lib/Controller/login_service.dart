import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/environment.dart';
import '../Model/responseLogin.dart';

class LoginService {

  final http.Client request =  http.Client();

  Future<ResponseLogin> login(String email, String password) async{
    final uri = Uri.http(Environment.apiUrl, Environment.loginPath);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'username': email, 'password': password});
    var bodyRep;
    try{
      final response = await http.post(uri, headers: headers, body: body).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 200){
        bodyRep = jsonDecode(response.body);
        //final prefs = await SharedPreferences.getInstance();
        //prefs.setString('tokenJWT', bodyRep["accessToken"]);
        return ResponseLogin(true, bodyRep["roles"][0], bodyRep["username"]);
      }else{
        return ResponseLogin(false, "Error de autenticacion", "");
      }
    } catch(ex){
      print(ex);
      return ResponseLogin(false, "Error de autenticacion","");
    }

  }
}