import 'package:get/get.dart';

import '../../../../presentation/delivery/controllers/delivery.controller.dart';

class DeliveryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryController>(
      () => DeliveryController(),
    );
  }
}
