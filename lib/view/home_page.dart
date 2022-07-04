import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/counter_controller.dart';
import 'package:getx_demo/view/next_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    print('Build Called');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                counterController.counter.value.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Text(
                  counterController.sum.value.toString(),
                  style: Theme.of(context).textTheme.headline3,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(NextPage());
                },
                child: const Text("Go to Next Page")),
            ElevatedButton(
              onPressed: () {
                // Get.snackbar('Hello', "THis is GetX Snackbar",
                //     snackPosition: SnackPosition.BOTTOM,
                //     backgroundColor: Colors.blue,
                //     colorText: Colors.white,
                //     snackStyle: SnackStyle.FLOATING);
                Get.showSnackbar(
                  const GetSnackBar(
                    title: "Hii",
                    message: "Hello",
                  ),
                );
              },
              child: const Text("Get Snackbar"),
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.defaultDialog(title: "Gext X", actions: [
                  //   TextButton(
                  //       onPressed: () {
                  //         Get.back();
                  //       },
                  //       child: Text("ok"))
                  // ]);
                  Get.dialog(const AlertDialog());
                },
                child: const Text("Get Dialog")),
            ElevatedButton(
                onPressed: () {
                  if (Theme.of(context).brightness == Brightness.dark) {
                    Get.changeTheme(ThemeData.light());
                  } else {
                    Get.changeTheme(ThemeData.dark());
                  }
                },
                child: const Text("Change Theme")),
            Container(
              height: Get.height * 0.25,
              width: Get.height * 0.25,
              color: Colors.red,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.green,
        onPressed: () {
          //counterController.incrementCounter();
          counterController.counter++;
          counterController.counterSum();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
