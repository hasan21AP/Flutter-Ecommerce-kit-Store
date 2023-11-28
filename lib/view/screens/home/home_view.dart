import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:ecommerce_kit_store/view/widgets/home/home_bod_not_verified.dart';
import 'package:ecommerce_kit_store/view/widgets/home/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetAuthentication().user?.emailVerified ? const HomeBody() : 
      const HomeBodyNotVerified(),
    );
  }
}