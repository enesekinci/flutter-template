import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../_core/view/base_view.dart';
import '../../components/drawer/cashier/cashier_drawer_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (context, controller, authController, mainController) {
      return Scaffold(
        appBar: AppBar(),
        drawer: CashierDrawerMenu(),
        body: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home Page"),
              FlatButton(
                color: Colors.blue,
                onPressed: () async {
                  await authController.logout();
                  Get.offAndToNamed("/login");
                },
                child: Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
        ),
      );
    });
  }
}
