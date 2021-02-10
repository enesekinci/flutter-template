import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_core/controller/auth_controller.dart';
import '../_core/controller/base_controller.dart';
import '../_core/controller/main_controller.dart';
import '../_core/view/base_view.dart';
import '../controller/counter_controller.dart';
import 'authenticate/login/view/login_page.dart';
import 'home/home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AuthController.instance.isLogin == true ? HomePage() : LoginPage();
    });
  }
}

class MainTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildCounterView();
  }

  BaseView<BaseController> buildCounterView() {
    return BaseView(
      controller: Get.put(CounterController()),
      onPageBuilder: (context, controller) {
        return Scaffold(
          appBar: buildAppBar(),
          body: buildBody(controller, context),
          floatingActionButton: buildFloatingActionButton(controller),
        );
      },
    );
  }

  Center buildBody(CounterController controller, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'hello'.tr,
          ),
          getCountView(controller, context),
        ],
      ),
    );
  }

  Column buildFloatingActionButton(CounterController controller) {
    final MainController mainController = Get.put(MainController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "floating-1",
          onPressed: () async {
            await controller.increment();
            Get.snackbar("Arttırma İşlemi", "Sayı Arttırıldı: " + controller.counter['count'].toString(),
                colorText: Colors.white, snackPosition: SnackPosition.TOP);
            mainController.changeTheme();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(height: 5),
        FloatingActionButton(
          heroTag: "floating-2",
          backgroundColor: Colors.red,
          onPressed: () async {
            await controller.decrement();
            Get.snackbar("Azaltma İşlemi", "Sayı Azaltıldı: " + controller.counter['count'].toString(),
                colorText: Colors.white, snackPosition: SnackPosition.TOP);
            mainController.changeTheme();
          },
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
        SizedBox(height: 5),
        FloatingActionButton(
          heroTag: "floating-3",
          backgroundColor: Colors.blue,
          onPressed: () {
            controller.remove();
          },
          tooltip: 'Remove',
          child: Icon(Icons.delete),
        ),
      ],
    );
  }

  Obx getCountView(CounterController controller, BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Text(
            controller.count.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            controller.rep.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          Hero(
            tag: "floating-4",
            child: FlatButton(
              onPressed: () => Get.toNamed('/second-page'),
              child: Text('Second Page'),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("widget.title"),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context, controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Hero(tag: "floating-4", child: Text("Second Page")),
                ),
                Container(
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('geri dön'),
                  ),
                )
              ],
            ),
          ),
        );
      },
      controller: Get.put(MainController()),
    );
  }
}