import 'package:get/get.dart';

class MainPageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
