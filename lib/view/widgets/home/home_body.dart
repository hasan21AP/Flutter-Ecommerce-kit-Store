import 'package:ecommerce_kit_store/controller/home/home_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
                },
              )
            ],
          ),
        );
      }
    );
  }
}