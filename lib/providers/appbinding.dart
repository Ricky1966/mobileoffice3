import 'package:get/get.dart';
import 'package:mobileoffice3/providers/bollecontroller.dart';
import 'package:mobileoffice3/providers/customerscontroller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClientiController());
    Get.lazyPut(() => BolleController());
  }
}
