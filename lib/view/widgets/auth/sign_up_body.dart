// import 'package:ecorommece_app_kit/controller/auth/authentication_controller.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_kit_store/controller/auth/sign_up_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/indicate_circle_dialog.dart';
import 'package:ecommerce_kit_store/core/functions/input_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImpl());
    return Center(
      child: GetBuilder<SignUpControllerImpl>(
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
                'Create an new account',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const VerticalSpace(value: 3),
              CustomTextFieldFormForUserName(
                formKey: controller.usernameState,
                validator: (val) => validInput(val!, 5, 15, 'username'),
                myController: controller.username,
                borderColor: AppColors.kMainColor,
                focusBorderColor: AppColors.kMainColor,
                hintText: 'Full Name',
                icon: const Icon(FontAwesomeIcons.user),
                textColor: AppColors.kGrayColor,
                iconColor: AppColors.kGrayColor,
                iconFocusColor: AppColors.kMainColor,
              ),
              const VerticalSpace(value: 1),
              CustomTextFieldFormForEmail(
                formKey: controller.emailState,
                validator: (val) => validInput(val!, 7, 30, 'email'),
                myController: controller.email,
                borderColor: AppColors.kMainColor,
                focusBorderColor: AppColors.kMainColor,
                hintText: 'Your Email',
                icon: const Icon(Icons.email_outlined),
                textColor: AppColors.kGrayColor,
                iconColor: AppColors.kGrayColor,
                iconFocusColor: AppColors.kMainColor,
              ),
              const VerticalSpace(value: 1),
              CustomTextFieldFormForPassword(
                formKey: controller.passwordState,
                validator: (val) => validInput(val!, 8, 20, 'password'),
                myController: controller.password,
                obscureText: controller.passwordVisible,
                borderColor: AppColors.kMainColor,
                focusBorderColor: AppColors.kMainColor,
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                onPressed: () => controller.changeState(),
                sefixIcon: Icon(controller.passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                textColor: AppColors.kGrayColor,
                iconColor: AppColors.kGrayColor,
                iconFocusColor: AppColors.kMainColor,
              ),
              const VerticalSpace(value: 1),
              CustomTextFieldFormForPassword(
                formKey: controller.rePasswordState,
                validator: (val) => validInput(val!, 8, 20, 'password'),
                myController: controller.rePassword,
                obscureText: controller.passwordVisible,
                borderColor: AppColors.kMainColor,
                focusBorderColor: AppColors.kMainColor,
                hintText: 'Password Again',
                prefixIcon: const Icon(Icons.lock_outline),
                onPressed: () => controller.changeState(),
                sefixIcon: Icon(controller.passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                textColor: AppColors.kGrayColor,
                iconColor: AppColors.kGrayColor,
                iconFocusColor: AppColors.kMainColor,
              ),
              const VerticalSpace(value: 2),
              CustomElevetedButton(
                text: 'Sign Up',
                textStyle: Theme.of(context).textTheme.displayMedium,
                mainColor: AppColors.kMainColor,
                secondColor: AppColors.kWhiteColor,
                relativisticWidth: 0.9,
                relativisticHeight: .07,
                circleRadius: 6,
                onPressed: () async{
                  if (controller.signUp() == true &&
                    controller.password.text == controller.rePassword.text){
                      User? result = await controller.signUpWithEmailAndPassword(
                        controller.username.text, 
                        controller.email.text, 
                        controller.password.text);
                      if (result != null){
                        customCircularProgressIndicator(context);
                        Future.delayed(const Duration(milliseconds: 800), 
                        () => controller.goToHomePage());
                      }
                  }
                }),
              const VerticalSpace(value: 3),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'have a account?',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                InkWell(
                    enableFeedback: false,
                    onTap: () {
                      controller.goToSignInPage();
                    },
                    child: Text(' Sign In',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.kMainColor,
                        fontWeight: FontWeight.w700,
                    )
                  )
                )
              ])
            ],
          );
        }
      ),
    );
  }
}
