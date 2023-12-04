
import 'package:ecommerce_kit_store/controller/auth/verify_code_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
            'Type the code that we sent to you',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const VerticalSpace(value: 10),
          GetBuilder<VerifyCodeControllerImpl>(
            builder: (controller) {
              return OtpTextField(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fieldWidth: SizeConfig.screenWidth! * 0.13,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                autoFocus: true,
                borderColor: AppColors.kGrayColor,
                focusedBorderColor: AppColors.kMainColor,
                showFieldAsBox: true, 
                // onCodeChanged: (String code) {
                //   return 'hello world';
                // },
                onSubmit: (String verificationCode){
                      showDialog(context: context, 
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kMainColor
                      )
                            )
                          );
                    // controller.goToResetPasswordPage();
          
                  }, 
               );
            },
          )
        ],
      ),
    );
  }
}