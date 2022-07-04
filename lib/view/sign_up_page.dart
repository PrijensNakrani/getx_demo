import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/view/welcome_page.dart';

class SignUpPage extends StatelessWidget {
  final _username = TextEditingController();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _username,
                decoration: const InputDecoration(hintText: "Username"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                box.write('username', _username.text).then(
                      (value) => Get.off(
                        () => WelcomePage(),
                      ),
                    );
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
