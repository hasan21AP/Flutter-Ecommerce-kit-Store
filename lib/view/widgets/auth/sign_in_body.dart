// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_kit_store/controller/auth/sign_in_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/indicate_circle_dialog.dart';
import 'package:ecommerce_kit_store/core/utils/size_config.dart';
import 'package:ecommerce_kit_store/data/model/sign_in_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImpl());
    return Center(
            child: GetBuilder<SignInControllerImpl>(
              builder: (controller) {
                return Column(
                  children: [
                    const UpperSignInModel(
                      title: 'Welcome to E-com',
                      supTitle: 'Sign in to continue',
                    ),                              
                    CustomSignInFieldModel(
                      formKey: controller.emailState, 
                      myController: controller.email,
                      hintText: "Your Email",
                      keyboardType: TextInputType.emailAddress,
                      validateType: 'email',
                      icon: Icons.email_outlined,
                      ),
                    const VerticalSpace(value: 1),
                    CustomSignInTextPasswordFieldModel(
                      formKey: controller.passwordState, 
                      myController: controller.password,
                      passwordVisible: controller.passwordVisible,
                      hintText: 'Password',
                      validateType: 'password',
                      onPressed: () => controller.changeState(),
                      ),
                    const VerticalSpace(value: 2),
                    CustomElevetedButton(
                      text: 'Sign In',
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      mainColor: AppColors.kMainColor,
                      secondColor: AppColors.kWhiteColor,
                      relativisticWidth: 0.9,
                      relativisticHeight: .07,
                      circleRadius: 6,
                      onPressed: () async{
                        if (controller.signIn() == true){
                          User? result = await controller.loginWithEmailAndPassword(
                            controller.email.text, 
                            controller.password.text);
                            if (result != null){
                              customCircularProgressIndicator(context);
                              Future.delayed(const Duration(milliseconds: 800),
                              () => controller.goToHomePage());
                          }
                        }
                      }
                    ),
                    const VerticalSpace(value: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 18),
                            child: CustomLineContainer(
                              color: AppColors.kLightColor,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text('OR',
                          style: Theme.of(context).textTheme.displayMedium
                          ),
                        ),
                        const Flexible(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: CustomLineContainer(
                              color: AppColors.kLightColor,
                            ),
                          ),
                        )
                      ],
                    ),
                const VerticalSpace(value: 2),
                CustomSignInButton(
                  elevation: 0,
                  text: 'Login with Google',
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  mainColor: AppColors.kTransparentColor,
                  secondColor: AppColors.kGrayColor,
                  iconData: FontAwesomeIcons.google,
                  relativisticWidth: 0.9,
                  relativisticHeight: .07,
                  horizontalPadding: SizeConfig.screenWidth! * .12,
                  circleRadius: 6,
                  iconSize: 26,
                  iconColor: AppColors.kMainColor,
                  borderWidth: 1,
                  borderColor: AppColors.kLightColor,
                  onPressed: () async{
                    customCircularProgWithVar(context, controller.isLoading);
                    if (await controller.signInWithGoogle() != null){
                      controller.goToHomePage();
                    }else {
                      controller.changeStateOfLoading();
                      print("Loading: ${controller.isLoading}");
                      customCircularProgWithVar(context, controller.isLoading);
                      
                    }
                  }
                ),
                const VerticalSpace(value: 1),
                CustomSignInButton(
                  elevation: 0,
                  text: 'Login with Facebook',
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  mainColor: AppColors.kTransparentColor,
                  secondColor: AppColors.kGrayColor,
                  iconData: FontAwesomeIcons.facebookF,
                  relativisticWidth: 0.9,
                  relativisticHeight: .07,
                  horizontalPadding: SizeConfig.screenWidth! * .12,
                  circleRadius: 6,
                  iconSize: 26,
                  iconColor: AppColors.kMainColor,
                  borderWidth: 1,
                  borderColor: AppColors.kLightColor,
                  onPressed: (){}
                ),
                const VerticalSpace(value: 2),
                InkWell(
                  enableFeedback: false,
                  onTap: (){
                    controller.goToForgetPasswordPage();
                  },
                  child: Text('Forgot Password?',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.kMainColor,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const VerticalSpace(value: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text( 'Don’t have a account?',
                  style: Theme.of(context).textTheme.displaySmall,
                  ),
                  InkWell(
                    enableFeedback: false,
                    onTap: (){
                      controller.goToSignUpPage();
                    },
                    child: Text(' Register',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.kMainColor,
                      fontWeight: FontWeight.w700,
                      )
                    )
                  )
                ]
              ),
            ],
          );
        }
      ),
    );
  }
}