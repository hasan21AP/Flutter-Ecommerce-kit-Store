
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/view/widgets/auth/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: 
           InkWell(
            onTap: (){
              Get.back();
            },
            enableFeedback: false,
            child: const Icon(Icons.navigate_before,)
            ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kMainColor,
        elevation: 0.0,
      ),
      body: const SignUpBody(),
    );
  }
}