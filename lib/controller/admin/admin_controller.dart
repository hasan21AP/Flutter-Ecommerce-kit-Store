import 'package:ecommerce_kit_store/core/services/services.dart';
import 'package:get/get.dart';

abstract class AdminController extends GetxController {
  logout();
  goToAddProductPage();

}

class AdminControllerImpl extends AdminController {

  MyServices myServices = Get.find();
  
  
  
  @override
  logout() {
    Get.offAllNamed('/signIn');
  }
  
  @override
  goToAddProductPage() {
    Get.toNamed('/addProduct');
  }
  


}