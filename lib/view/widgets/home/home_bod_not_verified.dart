import 'package:ecommerce_kit_store/controller/home/home_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
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
              const VerticalSpace(value: 10),
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
              const VerticalSpace(value: 2),
              CustomElevetedButton(
                text: 'Please Verify your Email',
                mainColor: AppColors.kMainColor,
                secondColor: AppColors.kWhiteColor,
                textStyle: Theme.of(context).textTheme.displayMedium,
                relativisticWidth: 0.8,
                relativisticHeight: .07,
                circleRadius: 6,
                onPressed: () {
                  controller.sendEmailVerification();
                  Get.defaultDialog(
                    title: 'Email is sent',
                    titleStyle: Theme.of(context).textTheme.displayLarge,
                    middleText: 'Go to your email click on the link to verify your code',
                    middleTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.kMainColor,
                    ),
                    backgroundColor: AppColors.kWhiteColor,
                    onConfirm: (){
                      controller.logOut();
                      controller.goToSignInPage();
                    },
                    buttonColor: AppColors.kMainColor,
                  );
                },
              )
            ],
          ),
        );
      }
    );
  }
}