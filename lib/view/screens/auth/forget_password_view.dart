import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/view/widgets/auth/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
            child: const Icon(Icons.navigate_before)
            ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kMainColor,
        elevation: 0.0,
      ),
      body: const ForgetPasswordBody(),
    );
  }
}