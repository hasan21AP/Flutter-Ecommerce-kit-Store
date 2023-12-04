import 'package:ecommerce_kit_store/controller/home/home_controller.dart';
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/data/model/button_model/elevated_button_model.dart';
import 'package:ecommerce_kit_store/data/model/text_field_model/general_text_field_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreenBody extends GetWidget<HomeControllerImpl> {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 8,
                  child: GeneralTextFieldModel(
                    formKey: controller.searchState, 
                    myController: controller.search,
                    validateType: 'search',
                    keyboardType: TextInputType.text,
                    icon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: AppColors.kMainColor,
                      ),
                    hintText: 'Search Product',
                    ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    child: const Icon(
                      FontAwesomeIcons.heart,
                      size: 30,
                      color: AppColors.kGrayColor,
                      ),
                    onTap: (){},
                    ),
                ),
                const HorizanintalSpace(value: 2),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    child: const Icon(
                      FontAwesomeIcons.bell,
                      color: AppColors.kGrayColor,
                      size: 30,
                      ),
                    onTap: (){},
                    ),
                ),
              ],
            ),
            const VerticalSpace(value: 3),
            const CustomLineContainer(
              color: AppColors.kLightColor,
            ),
            const VerticalSpace(value: 2),
            Image.asset(ImagesAssets.promotionImage),
            const VerticalSpace(value: 10),
            ElevatedButtonModel(
              text: 'Log out',
              onPressed: () async{
                await controller.logOut();
                controller.goToSignInPage();
              },  
            )
          ],
        );
  }
}