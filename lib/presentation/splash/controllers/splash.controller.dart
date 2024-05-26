import 'package:car_delivery/presentation/home/home.screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt positionX = (-200).obs as RxInt;
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const HomeScreen());
    });
  }
}
