import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:ecommerce_kit_store/core/functions/input_validation.dart';
import 'package:flutter/material.dart';

class UpperSignInModel extends StatelessWidget {
  const UpperSignInModel({super.key, this.title, this.supTitle});

  final String? title;
  final String? supTitle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const VerticalSpace(value: 5),
      Image.asset(ImagesAssets.iconImage),
      const VerticalSpace(value: 2),
      Text(title! ,
      style: Theme.of(context).textTheme.displayLarge,),
      const VerticalSpace(value: 1),
      Text(supTitle! ,
      style: Theme.of(context).textTheme.displaySmall,),
      const VerticalSpace(value: 3),
    ]);
  }
}

class CustomSignInFieldModel extends StatelessWidget {
  const CustomSignInFieldModel({super.key, required this.formKey, 
  required this.myController, this.hintText, 
  this.validateType, this.keyboardType, this.icon});

  final GlobalKey<FormState> formKey;
  final TextEditingController myController;
  final String? hintText;
  final String? validateType;
  final TextInputType? keyboardType;
  final IconData? icon;

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
      icon: Icon(icon),
      textColor: AppColors.kGrayColor,
      iconColor: AppColors.kGrayColor,
      iconFocusColor: AppColors.kMainColor,
      keyboardType: keyboardType,
      );
  }
}


class CustomSignInTextPasswordFieldModel extends StatelessWidget {
  const CustomSignInTextPasswordFieldModel({super.key, 
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