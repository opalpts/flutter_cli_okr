import 'package:get/get.dart';

import 'consent_controller.dart';

class ConsentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsentController>(
      () => ConsentController(),
    );
  }
}
