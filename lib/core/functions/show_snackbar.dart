
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:get/get.dart';

customSnackbar(title, message){
  Get.snackbar(title, message, 
        backgroundColor: AppColors.kMainColor);
}