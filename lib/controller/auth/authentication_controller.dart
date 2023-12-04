import 'package:ecommerce_kit_store/controller/database/firestore_user.dart';
import 'package:ecommerce_kit_store/core/functions/show_snackbar.dart';
import 'package:ecommerce_kit_store/core/functions/update_username.dart';
import 'package:ecommerce_kit_store/core/services/services.dart';
import 'package:ecommerce_kit_store/data/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GetAuthentication {

  FirebaseAuth? _auth;
  GoogleSignIn? _googleSignIn;
  late MyServices myServices;
  String? providerId;

  GetAuthentication(){
    myServices = Get.find();
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    providerId = _auth?.currentUser?.providerData.elementAt(0).providerId;
    print('User is: ${user?.email}');
    print('Email Verified: $emailVerified');
    print('Username: $username');
    _auth?.authStateChanges().listen((User? user) {
      if (user == null){
        myServices.sharedPreferences.setString("Is Signed", "no");
      }else {
        myServices.sharedPreferences.setString("Is Signed", "yes");
        }
      }
    );
  }


  User? get user => _auth?.currentUser;
  bool? get emailVerified => _auth?.currentUser?.emailVerified;
  


  Future<User?> signUpWithEmailAndPassword(String email, 
  String password, BuildContext context) async{
    try {
        final credential = await _auth?.createUserWithEmailAndPassword(
        email: email,
        password: password
        ).then((user) async{ 
          await saveUser(user);
        });
          Get.offAllNamed('/home');
          Get.deleteAll();
        return credential?.user;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          customSnackbar('Invalid Email', e.message);
    
      }
      else if (e.code == 'email-already-in-use'){
        customSnackbar('Email Error', e.message);

      }
      else if (e.code == 'weak-password'){
        customSnackbar('Weak Password', e.message);
  

      } else {
        customSnackbar('Error is ${e.code}', e.message);
  
      }
    }
    return null;
  }

  sendLinkVeriyEmail() async{
    try {
      await _auth?.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  Future<bool?> sendLinkResetPassword(String email) async{
    try {
      await _auth?.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          customSnackbar('Invalid Email', e.message);

      }
      else if (e.code == 'user-not-found'){
        customSnackbar('User not found', e.message);
      }else if (e.code == 'invalid-credential'){
        customSnackbar('Invalid Credential', 'Email is wrong');
      } 
      else {
        customSnackbar('Error is ${e.code}', '${e.message}');
      }
    }
    return null;
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async{
    try {
        final credential = await _auth?.signInWithEmailAndPassword(
        email: email,
        password: password);
        Get.offAllNamed('/home');
        Get.deleteAll();
        return credential?.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          customSnackbar('Invalid Email', e.message);

      }
      else if (e.code == 'user-not-found'){
        customSnackbar('User not found', e.message);
      }
      else if (e.code == 'wrong-password'){
        customSnackbar('Wrong Password', e.message);
      }else if (e.code == 'invalid-credential') {
        customSnackbar('Invalid Credential', 'Email or Password is wrong or both of them');
        
      } 
      else {
        customSnackbar('Error is ${e.code}', '${e.message}');
      }
    }
    return null;
  }
  

  Future<UserCredential?> signInWithGoolge() async{
    try{
    final GoogleSignInAccount? googleUser = await _googleSignIn?.signIn();
    if (googleUser == null) return null;

  // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

  // Once signed in, return the UserCredential
    final authResult = await _auth?.signInWithCredential(credential).then((user) async{
      await saveUser(user);
    });
    Get.offAllNamed('/home');
    return authResult;

    }on FirebaseAuthException catch (e) {
      print("The Exception is: $e");
      return null;
    }
    

  }

  Future<void> logout() async{
    if (providerId == 'google.com'){
      await _auth?.signOut();
      await _googleSignIn?.disconnect();
    }else {
      await _auth?.signOut();
    }
    myServices.sharedPreferences.clear();
  }

  Future<void> saveUser(UserCredential? user) async{
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user?.user?.uid,
      email: user?.user?.email,
      name: username ?? user?.user?.displayName,
      pic: ''
    ));
  }

}



