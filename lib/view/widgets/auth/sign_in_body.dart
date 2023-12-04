import 'package:ecommerce_kit_store/controller/auth/sign_in_controller.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/indicate_circle_dialog.dart';
import 'package:ecommerce_kit_store/data/model/sign_in/bottom_sign_model.dart';
import 'package:ecommerce_kit_store/data/model/button_model/elevated_button_model.dart';
import 'package:ecommerce_kit_store/data/model/button_model/elevated_icon_button_model.dart';
import 'package:ecommerce_kit_store/data/model/center_line_separetion/line_separetion.dart';
import 'package:ecommerce_kit_store/data/model/on_pressed_text_model/on_pressed_text_model.dart';
import 'package:ecommerce_kit_store/data/model/sign_in/upper_sign_model.dart';
import 'package:ecommerce_kit_store/data/model/text_field_model/general_text_field_model.dart';
import 'package:ecommerce_kit_store/data/model/text_field_model/password_text_feild_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInBody extends GetWidget<SignInControllerImpl> {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
            child: GetBuilder<SignInControllerImpl>(
              builder: (controller) {
                return Column(
                  children: [
                    const UpperSignModel(
                      title: 'Welcome to E-com',
                      supTitle: 'Sign in to continue',
                    ),                              
                    GeneralTextFieldModel(
                      formKey: controller.emailState, 
                      myController: controller.email,
                      hintText: "Your Email",
                      keyboardType: TextInputType.emailAddress,
                      validateType: 'email',
                      icon: const Icon(Icons.email_outlined),
                      ),
                    const VerticalSpace(value: 1),
                    PasswordTextFieldModel(
                      formKey: controller.passwordState, 
                      myController: controller.password,
                      passwordVisible: controller.passwordVisible,
                      hintText: 'Password',
                      validateType: 'password',
                      onPressed: () => controller.changeState(),
                      ),
                    const VerticalSpace(value: 2),
                    ElevatedButtonModel(
                      text: 'Sign In',
                      onPressed: () async{
                        if (controller.signIn() == true){
                          customCircularProgressIndicator(context);
                          if (await controller.loginWithEmailAndPassword(
                                controller.email.text, 
                                controller.password.text) == null) {
                                  await Future.delayed(const Duration(seconds: 5), (){
                                    Get.back();
                                  });
                                }
                        }
                      },
                    ),
                    const VerticalSpace(value: 1),
                    const LineSeparetionContainer(),
                    const VerticalSpace(value: 2),
                    ElevatedIconButtonModel(
                      text: 'Login with Google',
                      icon: FontAwesomeIcons.google,
                      onPressed: () async{
                        customCircularProgressIndicator(context);
                        if (await controller.signInWithGoogle() == null){
                          Get.back();
                        }
                      },
                    ),
                    const VerticalSpace(value: 1),
                    ElevatedIconButtonModel(
                      text: 'Login with facebook',
                      icon: FontAwesomeIcons.facebookF,
                      onPressed: (){}
                    ),
                    const VerticalSpace(value: 2),
                    OnPresseTextModel(
                      text: 'Forgot Password?',
                      onTap: (){
                        controller.goToForgetPasswordPage();
                      },
                    ),
                    const VerticalSpace(value: 1),
                    BottomSignModel(
                      text: 'Don’t have a account?',
                      onTapText: ' Register',
                      onTap: (){
                        controller.goToSignUpPage();
                      },
                    ),
                    const VerticalSpace(value: 3),
                    BottomSignModel(
                      text: 'Are you Admin? ',
                      onTapText: 'Admin',
                      onTap: (){
                        controller.goToAdminPage();
                      },
                    )
            ],
          );
        }
      ),
    );
  }
}