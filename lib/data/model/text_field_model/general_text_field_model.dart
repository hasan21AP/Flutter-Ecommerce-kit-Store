
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/functions/input_validation.dart';
import 'package:flutter/material.dart';

class GeneralTextFieldModel extends StatelessWidget {
  const GeneralTextFieldModel({super.key, required this.formKey, 
  required this.myController, this.hintText, 
  this.validateType, this.keyboardType, this.icon});

  final GlobalKey<FormState> formKey;
  final TextEditingController myController;
  final String? hintText;
  final String? validateType;
  final TextInputType? keyboardType;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldFormForEmail(
      formKey: formKey, 
      validator: (val){
        return validInput(val!,7,30,validateType!);
      },
      myController: myController,
      borderColor: AppColors.kMainColor,
      focusBorderColor: AppColors.kMainColor,
      hintText: hintText,
      icon: icon,
      textColor: AppColors.kGrayColor,
      iconColor: AppColors.kGrayColor,
      iconFocusColor: AppColors.kMainColor,
      keyboardType: keyboardType,
      );
  }
}