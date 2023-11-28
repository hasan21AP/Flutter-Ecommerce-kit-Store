
import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {

  logOut();
  goToSignInPage();

}


class HomeControllerImpl extends HomeController {
  
  
  @override
  goToSignInPage() {
    Get.offAllNamed('/sigIn');

  }
  
  @override
  logOut() async{
    await GetAuthentication().logout();
  }

}