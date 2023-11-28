
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  bool verificationCode(String checkCode);
  goToResetPasswordPage();

}

class VerifyCodeControllerImpl extends VerifyCodeController {

  late String code;
  
  @override
  bool verificationCode(String checkCode) {
    if (checkCode == code) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  goToResetPasswordPage() {
    Get.toNamed('/resetPassword');
  }
  


}