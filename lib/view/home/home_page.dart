import 'package:flutter/material.dart';
import 'package:fluttertemplate/controller/drawer/drawer_menu_controller.dart';
import 'package:get/get.dart';

import '../../_core/controller/auth_controller.dart';
import '../../_core/controller/main_controller.dart';
import '../../_core/view/base_view.dart';

class HomePage extends StatelessWidget {
  final drawerMenuController = Get.put(DrawerMenuController());
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context, controller) {
        return Scaffold(
          appBar: AppBar(),
          drawer: buildDrawer(controller),
          body: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Home Page"),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    // AuthController authController = Get.find(tag: "AuthController");
                    await AuthController.instance.logout();
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
      },
      controller: Get.put(
        MainController(),
      ),
    );
  }

  Drawer buildDrawer(controller) {
    return Drawer(
      elevation: 0.5,
      child: ListView(
        children: [
          buildDrawerHeader(controller),
          buildDrawerMenuItems(),
        ],
      ),
    );
  }

  Widget buildDrawerMenuItems() {
    return Column(
      children: [
        ListTile(
          focusColor: Colors.grey,
          title: Text('Anasayfa'),
          leading: Icon(Icons.home),
          onTap: () => Get.offAllNamed('/'),
          trailing: Icon(Icons.arrow_right_outlined),
        ),
        ExpansionTile(
          leading: Icon(Icons.shopping_basket_outlined),
          title: Text("Kasa"),
          trailing: Obx(() => drawerMenuController.openMenuIcon.value),
          onExpansionChanged: (value) {
            if (value) {
              drawerMenuController.openingMenu();
            } else {
              drawerMenuController.closingMenu();
            }
          },
          children: [
            ListTile(
              focusColor: Colors.grey,
              title: Text('Barkod Okuyucu'),
              leading: Icon(Icons.qr_code_outlined),
              onTap: () => Get.toNamed("/barcode-reader"),
              trailing: Icon(Icons.arrow_right_outlined),
            ),
          ],
        )
      ],
    );
  }

  DrawerHeader buildDrawerHeader(controller) {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        child: Container(
          color: controller.getThemePrimaryColor(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Text(
                      'Vidyocu Azaddddtt',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => print("logout"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
