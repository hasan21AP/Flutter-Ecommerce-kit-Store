import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

customCircularProgressIndicator(BuildContext context){
    showDialog(context: context, 
        builder:
          (context) => const Center(child: 
          CircularProgressIndicator(
            color: AppColors.kMainColor 
      )
    ) 
  );
}

customCircularProgWithVar(BuildContext context, bool isLoading){
  if (isLoading == true){
    showDialog(context: context, 
      builder:
        (context) => const Center(child: 
        CircularProgressIndicator(
          color: AppColors.kMainColor 
    )
  ) 
);
  }else {
    Get.back();
  }
}
