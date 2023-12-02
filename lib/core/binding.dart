import 'package:ecommerce_kit_store/controller/admin/admin_controller.dart';
import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:ecommerce_kit_store/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_kit_store/controller/auth/sign_in_controller.dart';
import 'package:ecommerce_kit_store/controller/auth/sign_up_controller.dart';
import 'package:ecommerce_kit_store/controller/home/home_controller.dart';
import 'package:get/get.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAuthentication());
    Get.lazyPut(() => HomeControllerImpl());
    Get.lazyPut(() => SignInControllerImpl());
    Get.lazyPut(() => SignUpControllerImpl());
    Get.lazyPut(() => ForgetPasswordControllerImpl());
    Get.lazyPut(() => AdminControllerImpl());
  }

}