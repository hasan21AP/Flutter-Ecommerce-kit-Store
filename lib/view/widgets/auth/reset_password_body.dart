import 'package:ecommerce_kit_store/controller/auth/reset_password_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControlelrImpl());
    return Center(
            child: GetBuilder<ResetPasswordControlelrImpl>(
              builder: (controller) {
                return Column(
                  children: [
                    const VerticalSpace(value: 5),
                    Image.asset(ImagesAssets.iconImage),
                    const VerticalSpace(value: 2),
                    Text('Welcome to E-com' ,
                    style: Theme.of(context).textTheme.displayLarge),
                    const VerticalSpace(value: 1),
                    Text('Reset Your Password' ,
                    style: Theme.of(context).textTheme.displaySmall),
                    const VerticalSpace(value: 3),
                    CustomTextFieldFormForPassword(
                      formKey: controller.passwordState,
                      validator: (val) => validInput(val!, 8, 30, 'password'),
                      myController: controller.password,
                      obscureText: controller.passwordVisible,
                      borderColor: AppColors.kMainColor,
                      focusBorderColor: AppColors.kMainColor,
                      hintText: 'New Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      onPressed: () => controller.changeState(),
                      sefixIcon: Icon(
                            controller.passwordVisible ? 
                            Icons.visibility_off_outlined : 
                            Icons.visibility_outlined
                          ),
                      textColor: AppColors.kGrayColor,
                      iconColor: AppColors.kGrayColor,
                      iconFocusColor: AppColors.kMainColor,
                      ),
                    const VerticalSpace(value: 2),
                    CustomElevetedButton(
                      text: 'Save',
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      mainColor: AppColors.kMainColor,
                      secondColor: AppColors.kWhiteColor,
                      relativisticWidth: 0.9,
                      relativisticHeight: .07,
                      circleRadius: 6,
                      onPressed: (){
                        if (controller.resetPassword() == true){
                          showDialog(context: context, 
                          builder:
                            (context) => const Center(child: 
                            CircularProgressIndicator(
                              color: AppColors.kMainColor 
                              )
                            ) 
                          );
                          controller.goToSignInPage();
                        }
                      }
                    ),
          ],
      );
              }
            ),
    );
  }
}