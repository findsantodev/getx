import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/config/enum/e_bottom_navigation.dart';
import 'package:getx/controller/main/main_controller.dart';
import 'package:getx/routes/routes.dart';
import 'package:getx/view/quote.dart';
import 'package:getx/view/user.dart';

import '../component/navigation/bottom_navigation.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Obx(
              () => Visibility(
                visible:
                    mainController.currentPage.value == EBottomNavigation.home,
                child: const Text("Kanye West Quotes"),
              ),
            ),
            Obx(
              () => Visibility(
                visible:
                    mainController.currentPage.value == EBottomNavigation.user,
                child: const Text("Personal Quotes"),
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => Get.offNamed(Routes.getInitialRoute()),
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Apakah anda yakin ingin keluar?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith((state) {
                        return Colors.grey[500];
                      }),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                      'Tidak',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith((state) {
                        return Colors.black;
                      }),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(
                      'Ya',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Obx(
                      () => Visibility(
                        visible: mainController.currentPage.value ==
                            EBottomNavigation.home,
                        child: const VQuote(),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: mainController.currentPage.value ==
                            EBottomNavigation.user,
                        child: const VUser(),
                      ),
                    ),
                  ],
                ),
              ),
              BottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
