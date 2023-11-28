
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyCodePage();
  enterEmail();

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
  goToVerifyCodePage() {
    Get.toNamed('/verifyCode');
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


}