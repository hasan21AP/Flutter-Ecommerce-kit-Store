import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {

  changeState();
  goToHomePage();
  goToSignInPage();
  bool signUp();
  Future<User?> signUpWithEmailAndPassword(String email,String password, BuildContext context);
  changeStateOfLoading();
}

class SignUpControllerImpl extends SignUpController {

  GlobalKey<FormState> usernameState = GlobalKey<FormState>();
  GlobalKey<FormState> emailState = GlobalKey<FormState>();
  GlobalKey<FormState> passwordState = GlobalKey<FormState>();
  GlobalKey<FormState> rePasswordState = GlobalKey<FormState>();
  bool passwordVisible = true;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController rePassword;
  bool isLoading = true;

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  changeState() {
    passwordVisible = !passwordVisible;
    update();
  }
  
  @override
  goToHomePage() {
    Get.offAllNamed('/home');
    Get.deleteAll();
  }
  
  @override
  goToSignInPage() {
    Get.offAllNamed('/signIn');
    Get.deleteAll();
  }
  
  @override
  bool signUp() {
    var usernameData = usernameState.currentState;
    var emailData = emailState.currentState;
    var passwordData = passwordState.currentState;
    var rePasswordData = rePasswordState.currentState;
    if (usernameData!.validate() && emailData!.validate() && 
        passwordData!.validate() && rePasswordData!.validate()){
      print('Valid');
      return true;
    }else {
      print('InValid');
      return false;
    }
  }
  
  @override
  Future<User?> signUpWithEmailAndPassword(String email,String password, BuildContext context) async{
    isLoading = true;
    update();
    return await GetAuthentication().signUpWithEmailAndPassword(email, password, context);
  }
  
  @override
  changeStateOfLoading() {
    isLoading = !isLoading;
    update();
  }
  

}