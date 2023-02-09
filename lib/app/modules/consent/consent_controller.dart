import 'package:get/get.dart';

class ConsentController extends GetxController {
  //TODO: Implement ConsentController

  var term = false.obs;
  var condition = false.obs;
  var isActive = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkButtonTerm(data) {
    term.value = data;

    if (term.value && condition.value) {
      isActive.value = true;
    } else {
      isActive.value = false;
    }
  }

  void checkButtonCon(data) {
    condition.value = data;

    if (term.value && condition.value) {
      isActive.value = true;
    } else {
      isActive.value = false;
    }
  }
}
