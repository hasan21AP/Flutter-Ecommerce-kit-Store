import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:ecommerce_kit_store/controller/home/home_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBodyNotVerified extends StatelessWidget {
  const HomeBodyNotVerified({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) {
        return Center(
          child: Column(
            children: [
              Center(
                child: Text('Home',
                style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const VerticalSpace(value: 5),
                Image.asset(ImagesAssets.iconImage),
                const VerticalSpace(value: 2),
                Text('Welcome to E-com' ,
                style: Theme.of(context).textTheme.displayLarge,),
                const VerticalSpace(value: 1),
                Text('Please Verify your Email to continue' ,
                style: Theme.of(context).textTheme.displaySmall,),
                const VerticalSpace(value: 3),  
              const VerticalSpace(value: 5),
              CustomElevetedButton(
                text: 'Send the link',
                mainColor: AppColors.kMainColor,
                secondColor: AppColors.kWhiteColor,
                textStyle: Theme.of(context).textTheme.displayMedium,
                relativisticWidth: 0.8,
                relativisticHeight: .07,
                circleRadius: 6,
                onPressed: () async{
                  await GetAuthentication().sendLinkVeriyEmail();
                  if (!context.mounted) return;
                  CustomShowDialog(
                    isLoading: controller.isLoading,
                    context: context,
                    title: 'Email is Sent',
                    content: 'The verify link is sent your email go verify your email and then click ok',
                    onConfirm: () async{
                      if (GetAuthentication().emailVerified == true){
                        await controller.logOut();
                        controller.goToSignInPage();
                      }else {
                        Get.back();
                        AwesomeDialog(
                          context: context,
                          title: 'Sorry your Email is not Verified',
                          titleTextStyle: Theme.of(context).textTheme.displayLarge,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          desc: 'Please go to your email and click on the link to verify',
                        ).show();
                      }
                    },
                    onCancel: (){}
                  ).customShowDialog();
                }),
              const VerticalSpace(value: 2),
              CustomElevetedButton(
                text: 'Log out',
                mainColor: AppColors.kMainColor,
                secondColor: AppColors.kWhiteColor,
                textStyle: Theme.of(context).textTheme.displayMedium,
                relativisticWidth: 0.8,
                relativisticHeight: .07,
                circleRadius: 6,
                onPressed: () async{
                  await controller.logOut();
                  controller.goToSignInPage();
                }),
            ],
          ),
        );
      }
    );
  }
}