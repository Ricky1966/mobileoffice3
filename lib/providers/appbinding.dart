import 'package:get/get.dart';
import 'package:mobileoffice3/providers/scrivifilecontroller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScriviFileController());
  }
}

