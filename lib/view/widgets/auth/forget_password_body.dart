import 'package:ecommerce_kit_store/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImpl());
    return Center(
      child: GetBuilder<ForgetPasswordControllerImpl>(
        builder: (controller) {
          return Column(
            children: [
              const VerticalSpace(value: 5),
              Image.asset(ImagesAssets.iconImage),
              const VerticalSpace(value: 2),
              Text(
                'Welcome to E-com',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const VerticalSpace(value: 1),
              Text(
                'Check Your Email',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const VerticalSpace(value: 10),
              CustomTextFieldFormForEmail(
                formKey: controller.emailState,
                validator: (val) => validInput(val!, 8, 30, 'email'),
                myController: controller.email,
                borderColor: AppColors.kMainColor,
                focusBorderColor: AppColors.kMainColor,
                hintText: 'Enter Your Email',
                icon: const Icon(Icons.email_outlined),
                textColor: AppColors.kGrayColor,
                iconColor: AppColors.kGrayColor,
                iconFocusColor: AppColors.kMainColor,
              ),
              const VerticalSpace(value: 2),
              CustomElevetedButton(
                  text: 'Check',
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  mainColor: AppColors.kMainColor,
                  secondColor: AppColors.kWhiteColor,
                  relativisticWidth: 0.9,
                  relativisticHeight: .07,
                  circleRadius: 6,
                  onPressed: () {
                    if (controller.enterEmail() == true){
                    showDialog(context: context, 
                    builder:
                      (context) => const Center(child: 
                      CircularProgressIndicator(
                        color: AppColors.kMainColor 
                        )
                      ) 
                    );
                    controller.goToVerifyCodePage();
                  }}),
                  
            ],
          );
        }
      ),
    );
  }
}
