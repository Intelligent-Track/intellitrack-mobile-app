import 'package:root_check/root_check.dart';

class ValidateRootService {
  Future<bool?> ValidateRoot()async{
    try{
      print("Valida Root");
      var checkForRootNative = await RootCheck.isRooted;
      print("validado: ${checkForRootNative!= null} ");
      if(checkForRootNative != null){
        print("validado: $checkForRootNative ");
        return checkForRootNative;
      }else{
        return false;
      }
    }catch(ex){
      return false;
    }
  }
}