
import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {

  Future<void> logOut();
  goToSignInPage();
  sendEmailVerification();
  changeStateOfLoading();

}


class HomeControllerImpl extends HomeController {

  bool isLoading = true;
  
  
  @override
  goToSignInPage() {
    Get.offAllNamed('/sigIn');

  }
  
  @override
  Future<void> logOut() async{
    await GetAuthentication().logout();
  }
  

  @override
  sendEmailVerification() {
    GetAuthentication().sendLinkVeriyEmail();
  }
  
  @override
  changeStateOfLoading() {
    isLoading = !isLoading;
    update();
  }
}