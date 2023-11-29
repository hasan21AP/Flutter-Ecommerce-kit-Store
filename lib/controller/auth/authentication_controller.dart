
import 'package:ecommerce_kit_store/core/functions/show_snackbar.dart';
import 'package:ecommerce_kit_store/core/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GetAuthentication extends GetxController{

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
    print('Email Verified: ${emailVerified}');
    print('Provider Id is: $providerId');
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


  Future<dynamic> signUpWithEmailAndPassword(String username, String email, String password) async{
    try {
        final credential = await _auth?.createUserWithEmailAndPassword(
        email: email,
        password: password
        );
        _auth?.currentUser?.updateDisplayName(username);
        return credential?.user;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          customSnackbar('Invalid Email', e.message);
          return false;
    
      }
      else if (e.code == 'email-already-in-use'){
        customSnackbar('Email Error', e.message);
        return false;
        
  
      }
      else if (e.code == 'weak-password'){
        customSnackbar('Weak Password', e.message);
        return false;
  

      } else {
        customSnackbar('Error is ${e.code}', e.message);
        return false;
  
      }
    }
  }

  sendLinkVeriyEmail(){
    try {
      _auth?.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async{
    try {
        final credential = await _auth?.signInWithEmailAndPassword(
        email: email,
        password: password);
  
        return credential?.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          customSnackbar('Invalid Email', e.message);
          // return false;
      }
      else if (e.code == 'user-not-found'){
        customSnackbar('User not found', e.message);
        // return false;
      }
      else if (e.code == 'wrong-password'){
        customSnackbar('Wrong Password', e.message);
        // return false;
      
      }else if (e.code == 'invalid-credential'){
        customSnackbar('Invalid Credential', 'Email or Password is wrong or both of them');
        // return false;
      } 
      else {
        customSnackbar('Error is ${e.code}', '${e.message}');
        // return false;
  
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
    final authResult = await _auth?.signInWithCredential(credential);
    assert(!authResult!.user!.isAnonymous);
    assert(await authResult?.user?.getIdToken() != null);
    final User? currentUser = _auth?.currentUser;
    assert(authResult?.user?.uid == currentUser?.uid);
    return authResult;

    }on Exception catch (e) {
      print(e);
      return null;
    }
    

  }

  Future logout() async{
    if (providerId == 'google.com'){
      await _auth?.signOut();
      await _googleSignIn?.disconnect();
    }else {
      await _auth?.signOut();
    }
    myServices.sharedPreferences.clear();
  }

}



