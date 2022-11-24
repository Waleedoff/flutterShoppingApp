import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ushop_app/view/screens/category_screen.dart';
import 'package:ushop_app/view/screens/favorites_screen.dart';
import 'package:ushop_app/view/screens/home_screen.dart';
import 'package:ushop_app/view/screens/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    'Asro shop',
    'categories',
    'favorite',
    'settings',
  ].obs;
}
