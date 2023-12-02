
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/functions/input_validation.dart';
import 'package:flutter/material.dart';

class PasswordTextFieldModel extends StatelessWidget {
  const PasswordTextFieldModel({super.key, 
  required this.formKey, 
  required this.myController, 
  this.hintText, this.validateType, 
  this.onPressed, 
  this.passwordVisible});

  final GlobalKey<FormState> formKey;
  final TextEditingController myController;
  final String? hintText;
  final String? validateType;
  final void Function()? onPressed;
  final bool? passwordVisible;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldFormForPassword(
      formKey: formKey,
      validator: (val){
        return validInput(val!, 8, 30, validateType!);
      },
      myController: myController,
      obscureText: passwordVisible,
      borderColor: AppColors.kMainColor,
      focusBorderColor: AppColors.kMainColor,
      hintText: 'Password',
      prefixIcon: const Icon(Icons.lock_outline),
      onPressed: onPressed,
      sefixIcon: Icon(
            passwordVisible! ? 
            Icons.visibility_off_outlined : 
            Icons.visibility_outlined
          ),
      textColor: AppColors.kGrayColor,
      iconColor: AppColors.kGrayColor,
      iconFocusColor: AppColors.kMainColor,
      );
  }
}