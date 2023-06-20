import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class albumcontroller extends GetxController {
  RxInt selectcat = 0.obs;

  void select(int index) {
    selectcat.value = index;
  }
}
