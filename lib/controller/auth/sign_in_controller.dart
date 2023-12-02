
import 'package:ecommerce_kit_store/core/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication_controller.dart';


abstract class SignInController extends GetxController {

  changeState();
  goToHomePage();
  goToSignUpPage();
  goToForgetPasswordPage();
  bool signIn();
  Future<UserCredential?> signInWithGoogle();
  Future<User?> loginWithEmailAndPassword(String email,String password);
  changeStateOfLoading();
  goToAdminPage();
}

class SignInControllerImpl extends SignInController {

  GlobalKey<FormState> emailState = GlobalKey<FormState>();
  GlobalKey<FormState> passwordState = GlobalKey<FormState>();
  bool passwordVisible = true;
  bool isLoading = true;
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  changeState() {
    passwordVisible = !passwordVisible;
    update();
  }
  
  @override
  goToForgetPasswordPage() {
    Get.toNamed('/forgetPassword');
  }
  
  @override
  goToHomePage() {
    // print(GetAuthentication().user);
    Get.offAllNamed('/home');
    Get.deleteAll();
  }
  
  @override
  goToSignUpPage() {
    Get.toNamed('/signUp');
  }
  
  @override
  bool signIn() {
    var emailData = emailState.currentState;
    var passwordData = passwordState.currentState;
    if (emailData!.validate() && passwordData!.validate()){
      return true;
    }else {
      return false;
    }
  }
  
  @override
  Future<UserCredential?> signInWithGoogle() async{
    isLoading = true;
    update();
    return await GetAuthentication().signInWithGoolge();
  }
  
  @override
  Future<User?> loginWithEmailAndPassword(String email,String password) async{
    isLoading = true;
    update();
    return await GetAuthentication().loginWithEmailAndPassword(email, password);
  }
  
  @override
  changeStateOfLoading() {
    isLoading = !isLoading;
    update();
  }
  
  @override
  goToAdminPage() {
    Get.offAllNamed('/admin');
  }

}