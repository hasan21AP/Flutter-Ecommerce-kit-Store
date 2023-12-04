
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication_controller.dart';

abstract class ForgetPasswordController extends GetxController {
  enterEmail();
  Future<bool?> sendResetPasswordLink(String email);
  goToSignInPage();

}

class ForgetPasswordControllerImpl extends ForgetPasswordController {


  GlobalKey<FormState> emailState = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  
  @override
  enterEmail() {
    var emailData = emailState.currentState;
    if (emailData!.validate()){
      print('Valid');
      return true;
    }else {
      print('InValid');
      return false;
    }
  }
  
  @override
  Future<bool?> sendResetPasswordLink(String email) async{
    return await GetAuthentication().sendLinkResetPassword(email);
  }
  
  @override
  goToSignInPage() {
    Get.offAllNamed('/signIn');
    Get.deleteAll();
  }


}