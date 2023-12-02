import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_kit_store/data/model/user_model/user_model.dart';


class FireStoreUser {

  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async{
      return await _userCollectionRef
          .doc(userModel.userId).set(userModel.toJson())
          .catchError((error) => print("Failed to add user: $error"));
  }
}