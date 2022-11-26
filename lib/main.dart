import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/main/main_controller.dart';
import 'package:getx/controller/quote/quote_controller.dart';
import 'package:getx/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: QuoteBinding(),
      initialRoute: Routes.getInitialRoute(),
      getPages: Routes.routes,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterController = Get.find<QuoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // Obx(
              //   () => Text(
              //     "${counterController.counter}",
              //     style: Theme.of(context).textTheme.headline4,
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     ElevatedButton(
              //       onPressed: counterController.increment,
              //       child: const Text("+"),
              //     ),
              //     ElevatedButton(
              //       onPressed: counterController.reset,
              //       child: const Text("0"),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         counterController.decrement();
              //         if (counterController.counter.value == 0) {
              //           Get.snackbar(
              //             'Hi',
              //             'i am a modern snackbar',
              //             snackPosition: SnackPosition.BOTTOM,
              //           );
              //         }
              //       },
              //       child: const Text("-"),
              //     ),
              //   ],
              // ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.getInitialRoute()),
                    child: const Text("Initial"),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.getHomeRoute()),
                    child: const Text("Home"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuoteBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => QuoteController());
    Get.lazyPut(() => MainController());
  }
}
