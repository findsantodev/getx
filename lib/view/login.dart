import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.offNamed(Routes.getHomeRoute()),
          child: const Text("LOGIN"),
        ),
      ),
    );
  }
}
