import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/environment.dart';
import '../Model/infoUser.dart';


class InfoUserService {

  final http.Client request =  http.Client();

  Future<InfoUser> infoUser(String username) async{
    final uri = Uri.http(Environment.apiUrl, Environment.infoUserPath + username);
    print (uri);
    try{
      final response = await http.get(uri).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if(response.statusCode == 200){
        var bodyRep = jsonDecode(response.body);
        print(bodyRep);
        return InfoUser(bodyRep['id'], bodyRep['name'],bodyRep['username'] ,bodyRep['document'] ,bodyRep['phone'] ,bodyRep['job'] ,bodyRep['location'] ?? "" ,bodyRep['nit'] ,bodyRep['companyName'] ,bodyRep['adm'],bodyRep['managerUsername'] );
      }else{
        return InfoUser(0,"","",0,0,"","","","",false,"");
      }
    } catch(ex){
      print(ex);
      return InfoUser(0,"","",0,0,"","","","",false,"");
    }

  }
}