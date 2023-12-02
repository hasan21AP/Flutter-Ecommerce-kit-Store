import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/view/widgets/admin/add_product_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

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
      body: const AddProductBody(),
    );
  }
}