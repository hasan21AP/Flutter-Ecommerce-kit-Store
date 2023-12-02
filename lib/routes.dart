
import 'package:ecommerce_kit_store/view/screens/admin/add_product_view.dart';
import 'package:ecommerce_kit_store/view/screens/auth/forget_password_view.dart';
import 'package:ecommerce_kit_store/view/screens/auth/sign_in_view.dart';
import 'package:ecommerce_kit_store/view/screens/auth/sign_up_view.dart';
import 'package:ecommerce_kit_store/view/screens/auth/verify_code_view.dart';
import 'package:ecommerce_kit_store/view/screens/home/home_view.dart';
import 'package:ecommerce_kit_store/view/screens/splash/splash_view.dart';
import 'package:get/get.dart';
import 'core/constants/routes.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screens/admin/admin_view.dart';

  List<GetPage<dynamic>> routes = [


    GetPage(name: AppRoutes.splash, page:() => const SplashView() , 
    middlewares: [MyMiddleware()]),

    GetPage(name: AppRoutes.signIn, page:() => const SignInView(), 
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(name: AppRoutes.signUp, page:() => const SignUpView(), 
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(name: AppRoutes.home, page:() => const HomeView(), 
    transition: Transition.fade, 
    transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(name: AppRoutes.forgetPassword, page:() => const ForgetPasswordView(), 
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(name: AppRoutes.verifyCode, page:() => const VerifyCodeView(), 
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(name: AppRoutes.admin, page:() => const AdminView(), 
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 400)
    ),
    GetPage(name: AppRoutes.addProduct, page:() => const AddProductView(), 
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 400)
    ),
    
  ];