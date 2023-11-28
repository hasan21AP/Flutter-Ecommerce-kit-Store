

import 'package:get/get.dart';

validInput(String val, int min, int max, String type){

  if (val.isEmpty){
    return 'Empty Field';
  }
  else {
    if (type == 'username'){
      if (!GetUtils.isUsername(val)){
        return 'Invalid Username';
      }
  }

  if (type == 'email'){
    if (!GetUtils.isEmail(val)){
      return 'Invalid Email';
    }
  }

  if (type == 'password'){
    if (GetUtils.isAlphabetOnly(val)){
      return 'Please mix you password between numbers and alphabet';
    } 
    if (GetUtils.isNumericOnly(val)){
      return 'Please mix you password between numbers and alphabet';
    }
  }

  if (type == 'phone'){
    if (!GetUtils.isPhoneNumber(val)){
      return 'Invalid Phone Number';
    }
  }

  if (val.length < min){
    return "Can't be less than $min";
  }

  if (val.length > max){
    return "Can't be more than $max";
  }
  }
}