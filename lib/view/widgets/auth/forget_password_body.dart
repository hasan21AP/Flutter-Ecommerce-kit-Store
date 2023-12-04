import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_kit_store/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/data/model/button_model/elevated_button_model.dart';
import 'package:ecommerce_kit_store/data/model/sign_in/upper_sign_model.dart';
import 'package:ecommerce_kit_store/data/model/text_field_model/general_text_field_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordBody extends GetWidget<ForgetPasswordControllerImpl> {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImpl());
    return Center(
      child: Column(
            children: [
              const UpperSignModel(
                title: 'Rese Password',
                supTitle: 'Enter your Email to continue',
              ),
              const VerticalSpace(value: 7),
              GeneralTextFieldModel(
                formKey: controller.emailState, 
                myController: controller.email,
                validateType: 'email',
                keyboardType: TextInputType.emailAddress,
                icon: const Icon(Icons.email_outlined),
                hintText: 'Enter Your Email',
                ),
              const VerticalSpace(value: 2),
              ElevatedButtonModel(
                text: 'Continue',
                onPressed: () async{
                  if (controller.enterEmail() == true) {
                    await controller.sendResetPasswordLink(
                      controller.email.text
                    );
                    if (!context.mounted) return;
                      AwesomeDialog(
                        context: context,
                        title: 'Reset Password',
                        titleTextStyle: Theme.of(context).textTheme.displayLarge,
                        desc: 'We sent link to your email please go to your email and click the link to reset password',
                        descTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.kMainColor,
                        ),
                        dialogType: DialogType.info,
                        animType: AnimType.leftSlide,
                        btnOkOnPress: (){
                          controller.goToSignInPage();
                        },
                    ).show();
              }
            },
          ),
        ],
      )
    );
  }
}
