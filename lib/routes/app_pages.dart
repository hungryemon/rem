import 'package:get/get.dart';

import '../modules/splash/splash_screen.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/create_todo/binding/create_todo_binding.dart';
import '../modules/create_todo/create_todo_screen.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/home_screen.dart';
import '../modules/sign_in/binding/sign_in_binding.dart';
import '../modules/sign_in/sign_in_screen.dart';
import '../modules/view_todo/binding/view_todo_binding.dart';
import '../modules/view_todo/view_todo_screen.dart';
import 'app_routes.dart';

class AppPages {

  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding:  SplashBinding(),
      
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.createTodo,
      page: () => CreateTodoScreen(),
      binding: CreateTodoBinding(),
    ),
    GetPage(
      name: AppRoutes.viewTodo,
      page: () => ViewTodoScreen(),
      binding:
        ViewTodoBinding(),
    ),
  ];
}
