import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/config/enum/e_bottom_navigation.dart';
import 'package:getx/controller/main/main_controller.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    Key? key,
  }) : super(key: key);

  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 206, 206, 206),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(() => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (mainController.currentPage.value ==
                          EBottomNavigation.home)
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : null,
                ),
                child: IconButton(
                  onPressed: () => (mainController.currentPage.value !=
                          EBottomNavigation.home)
                      ? mainController.changePage(
                          navigation: EBottomNavigation.home)
                      : null,
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )),
          Obx(() => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (mainController.currentPage.value ==
                          EBottomNavigation.user)
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : null,
                ),
                child: IconButton(
                  onPressed: () => (mainController.currentPage.value !=
                          EBottomNavigation.user)
                      ? mainController.changePage(
                          navigation: EBottomNavigation.user)
                      : null,
                  icon: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
