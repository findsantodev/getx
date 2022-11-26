import 'package:get/route_manager.dart';
import 'package:getx/view/home.dart';
import 'package:getx/view/login.dart';
import 'package:getx/view/user.dart';

abstract class Routes {
  static const initial = '/';
  static const home = '/home';
  static const user = '/user';

  static String getInitialRoute() => initial;
  static String getHomeRoute() => home;
  static String getUserRoute() => user;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const Login(),
    ),
    GetPage(
      name: home,
      page: () => const Home(),
    ),
    GetPage(
      name: user,
      page: () => const VUser(),
    ),
  ];
}
