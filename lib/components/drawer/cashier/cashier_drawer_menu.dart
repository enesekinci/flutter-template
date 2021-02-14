import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../_core/controller/main_controller.dart';
import '../../../_core/view/base_view.dart';
import '../../../controller/drawer/drawer_menu_controller.dart';

class CashierDrawerMenu extends StatefulWidget {
  @override
  _CashierDrawerMenuState createState() => _CashierDrawerMenuState();
}

class _CashierDrawerMenuState extends State<CashierDrawerMenu> {
  DrawerMenuController drawerMenuController;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      controller: DrawerMenuController.instance,
      onModelReady: (controller) => drawerMenuController = controller,
      onPageBuilder: (context, controller, authController, mainController) {
        return Drawer(
          elevation: 0.5,
          child: ListView(
            children: [
              buildDrawerHeader(mainController),
              buildDrawerMenuItems(),
            ],
          ),
        );
      },
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
        ListTile(
          focusColor: Colors.grey,
          title: Text('Events'),
          leading: Icon(Icons.settings_applications_outlined),
          onTap: () => Get.toNamed('/events'),
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
              onTap: () => Get.toNamed(
                "/barcode-reader",
              ),
              trailing: Icon(Icons.arrow_right_outlined),
            ),
          ],
        )
      ],
    );
  }

  DrawerHeader buildDrawerHeader(MainController mainController) {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        child: Container(
          color: mainController.getThemePrimaryColor(),
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
