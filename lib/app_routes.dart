import 'package:get/get.dart';
import 'views/home_screen.dart';
import 'views/result_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/result', page: () => ResultScreen()),
  ];
}
