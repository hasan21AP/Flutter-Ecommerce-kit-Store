import 'package:ecommerce_kit_store/controller/auth/sign_up_controller.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/indicate_circle_dialog.dart';
import 'package:ecommerce_kit_store/core/functions/update_username.dart';
import 'package:ecommerce_kit_store/data/model/sign_in/bottom_sign_model.dart';
import 'package:ecommerce_kit_store/data/model/button_model/elevated_button_model.dart';
import 'package:ecommerce_kit_store/data/model/sign_in/upper_sign_model.dart';
import 'package:ecommerce_kit_store/data/model/text_field_model/general_text_field_model.dart';
import 'package:ecommerce_kit_store/data/model/text_field_model/password_text_feild_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBody extends GetWidget<SignUpControllerImpl> {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GetBuilder<SignUpControllerImpl>(
          builder: (controller) {
            return Column(
                children: [
                  const UpperSignModel(
                    title: 'Let’s Get Started',
                    supTitle: 'Create an new account',
                  ),
                  GeneralTextFieldModel(
                    formKey: controller.usernameState, 
                    myController: controller.username,
                    validateType: 'username',
                    keyboardType: TextInputType.name,
                    icon: const Icon(FontAwesomeIcons.user),
                    hintText: 'Full Name',
                    ),
                  const VerticalSpace(value: 1),
                  GeneralTextFieldModel(
                    formKey: controller.emailState, 
                    myController: controller.email,
                    validateType: 'email',
                    keyboardType: TextInputType.emailAddress,
                    icon: const Icon(Icons.email_outlined),
                    hintText: 'Your Email',
                    ),
                  const VerticalSpace(value: 1),
                  PasswordTextFieldModel(
                    formKey: controller.passwordState, 
                    myController: controller.password,
                    passwordVisible: controller.passwordVisible,
                    onPressed: () => controller.changeState(),
                    validateType: 'password',
                    hintText: 'Password',
                    ),
                  const VerticalSpace(value: 1),
                  PasswordTextFieldModel(
                    formKey: controller.rePasswordState, 
                    myController: controller.rePassword,
                    passwordVisible: controller.passwordVisible,
                    onPressed: () => controller.changeState(),
                    validateType: 'password',
                    hintText: 'Password Again',
                    ),
                  const VerticalSpace(value: 2),
                  ElevatedButtonModel(
                    text: 'Sign Up',
                    onPressed: () async{
                      if (controller.signUp() == true &&
                        controller.password.text == controller.rePassword.text){
                          customCircularProgWithVar(context, controller.isLoading);
                          updateUsername(controller.username.text);
                          if (await controller.signUpWithEmailAndPassword(
                                controller.email.text, 
                                controller.password.text,
                                context) == null) {
                                  await Future.delayed(const Duration(seconds: 5),(){
                                    Get.back();
                                  });
                                }
                              }
                            },
                          ),
                  const VerticalSpace(value: 3),
                  BottomSignModel(
                      text: 'have a account?',
                      onTapText: ' Sign In',
                      onTap: (){
                        controller.goToSignInPage();
                  },
                )
              ],
            );
          }
        )
      );
    }
  }

