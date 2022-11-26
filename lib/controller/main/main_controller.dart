import 'package:get/get.dart';
import 'package:getx/config/enum/e_bottom_navigation.dart';

class MainController extends GetxController {
  var currentPage = EBottomNavigation.home.obs;

  changePage({required EBottomNavigation navigation}) =>
      currentPage.value = navigation;
}
