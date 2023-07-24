import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxString subject = "".obs;
  RxString description = "".obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxString id = ''.obs;
}
