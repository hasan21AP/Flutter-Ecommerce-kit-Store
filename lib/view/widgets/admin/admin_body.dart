import 'package:ecommerce_kit_store/controller/admin/admin_controller.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/data/model/button_model/elevated_button_model.dart';
import 'package:ecommerce_kit_store/data/model/sign_in/upper_sign_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdminBody extends StatelessWidget {
  const AdminBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminControllerImpl());
    return GetBuilder<AdminControllerImpl>(
      builder: (controller) {
        return Column(
          children: [
            const Center(
              child: UpperSignModel(
                title: 'Admin',
                supTitle: 'Add Products to your Store',
              ),
            ),
            const VerticalSpace(value: 10),
            ElevatedButtonModel(
              text: 'Add Product',
              onPressed: (){
                controller.goToAddProductPage();
              },
            ),
            const VerticalSpace(value: 3),
            ElevatedButtonModel(
              text: 'Add Category',
              onPressed: (){
                
              },
            ),
          ],
          
        );
      }
    );
  }
}