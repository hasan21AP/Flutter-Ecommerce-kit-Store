import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CustomFunctions {

  customShowDialog();
}

class CustomShowDialog extends CustomFunctions {

  CustomShowDialog( {this.title, this.content, 
  this.context, this.onConfirm, this.onCancel, this.isLoading,});
  final String? title;
  final String? content;
  final BuildContext? context;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  bool? isLoading;

  @override
  customShowDialog() {
    isLoading = true;
    return Get.defaultDialog(
    title: title!,
    titleStyle: Theme.of(context!).textTheme.displayLarge,
    middleText: content!,
    middleTextStyle: Theme.of(context!).textTheme.displayMedium!.copyWith(
      color: AppColors.kMainColor,
    ),
    backgroundColor: AppColors.kWhiteColor,
    onConfirm: onConfirm,
    buttonColor: AppColors.kMainColor,
    onCancel: onCancel,
    
  );
  }
}