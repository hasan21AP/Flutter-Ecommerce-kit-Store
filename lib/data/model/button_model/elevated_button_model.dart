
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_buttons.dart';
import 'package:flutter/material.dart';

class ElevatedButtonModel extends StatelessWidget {
  const ElevatedButtonModel({super.key, this.text, this.onPressed});

  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevetedButton(
      text: text,
      textStyle: Theme.of(context).textTheme.displayMedium,
      mainColor: AppColors.kMainColor,
      secondColor: AppColors.kWhiteColor,
      relativisticWidth: 0.9,
      relativisticHeight: .07,
      circleRadius: 6,
      onPressed: onPressed,
    );
  }
}