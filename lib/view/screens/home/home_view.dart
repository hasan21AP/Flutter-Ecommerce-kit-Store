import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:ecommerce_kit_store/view/widgets/home/home_bod_not_verified.dart';
import 'package:ecommerce_kit_store/view/widgets/home/home_body.dart';
import 'package:flutter/material.dart';

Widget? body(bool? emailVerified){
  if (emailVerified == true){
    return const HomeBody();
  }else if (emailVerified == false){
    return const HomeBodyNotVerified();
  }else {
    return const HomeBodyNotVerified();
  }
} 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GetAuthentication getAuthentication = GetAuthentication();
    print('Email Verified: ${getAuthentication.emailVerified}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: body(getAuthentication.emailVerified),
    );
  }
}