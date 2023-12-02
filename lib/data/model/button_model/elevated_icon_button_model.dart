
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:ecommerce_kit_store/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class ElevatedIconButtonModel extends StatelessWidget {
  const ElevatedIconButtonModel({super.key, this.text, this.icon, this.onPressed});

  final String? text;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomSignInButton(
      elevation: 0,
      text: text,
      textStyle: Theme.of(context).textTheme.displayMedium,
      mainColor: AppColors.kTransparentColor,
      secondColor: AppColors.kGrayColor,
      iconData: icon,
      relativisticWidth: 0.9,
      relativisticHeight: .07,
      horizontalPadding: SizeConfig.screenWidth! * .12,
      circleRadius: 6,
      iconSize: 26,
      iconColor: AppColors.kMainColor,
      borderWidth: 1,
      borderColor: AppColors.kLightColor,
      onPressed: onPressed,
    );
  }
}