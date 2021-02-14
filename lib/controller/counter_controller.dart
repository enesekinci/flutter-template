import 'package:fluttertemplate/_core/controller/base_controller.dart';
import 'package:get/get.dart';

class CounterController extends BaseController {
  // static CounterController _instance = CounterController._init();
  // static CounterController get instance => _instance;
  CounterController() {
    //
    Map<String, dynamic> getCounter = box.getData(key: 'counter');

    if (getCounter == null) {
      getCounter = {
        "count": 0,
        "rep": 0,
        "time": DateTime.now().toString(),
      };
    }

    this.counter = getCounter.obs;
  }
  RxMap counter;

  int get count => this.counter['count'];
  int get rep => this.counter['rep'];
  DateTime get time => this.counter['time'];

  set count(int value) => this.counter['count'] = value;
  set rep(int value) => this.counter['rep'] = value;
  set time(DateTime value) => this.counter['time'] = value.toString();

  Future<void> increment() async {
    this.counter['count']++;
    this.counter['rep']++;
    box.setData(key: 'counter', data: this.counter);
  }

  Future<void> decrement() async {
    this.counter['count']--;
    this.counter['rep']++;
    this.counter['time'] = DateTime.now().toString();
    box.setData(key: 'counter', data: this.counter);
    // print(this.counter);
  }

  Future<void> remove() async {
    int rep = this.counter['rep'];
    box.deleteData(key: 'counter');
    this.counter.refresh();
    this.counter = {
      "count": 0,
      "rep": rep,
      "time": DateTime.now().toString(),
    }.obs;
  }
}
