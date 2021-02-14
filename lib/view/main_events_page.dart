import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../_core/controller/main_controller.dart';
import '../_core/view/base_view.dart';
import '../controller/counter_controller.dart';

class MainEventsPage extends StatefulWidget {
  @override
  _MainEventsPageState createState() => _MainEventsPageState();
}

class _MainEventsPageState extends State<MainEventsPage> {
  CounterController counterController;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      controller: CounterController(),
      onModelReady: (controller) => counterController = controller,
      onDispose: () => counterController.dispose(),
      onPageBuilder: (context, controller, authController, mainController) {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "floating-1",
          onPressed: () async {
            await controller.increment();
            Get.snackbar("Arttırma İşlemi", "Sayı Arttırıldı: " + controller.counter['count'].toString(),
                colorText: Colors.white, snackPosition: SnackPosition.TOP);
            MainController.instance.changeTheme();
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
            MainController.instance.changeTheme();
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
      onModelReady: (controller) => controller = MainController.instance,
      onPageBuilder: (context, controller, authController, mainController) {
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
      // controller: MainController.instance,
    );
  }
}
