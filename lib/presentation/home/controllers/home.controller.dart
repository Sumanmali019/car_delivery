import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../../../infrastructure/dal/services/ride_service.dart';

class HomeController extends GetxController {
  final addresses = RxList<Map<String, dynamic>>([]);
  final cars = RxList<Map<String, dynamic>>([]);
  final pickupLocation = Rxn<Map<String, dynamic>>();
  final dropoffLocation = Rxn<Map<String, dynamic>>();
  final selectedCar = Rxn<Map<String, dynamic>>();
  final userName = ''.obs;
  final contactNumber = ''.obs;
  final email = ''.obs;
  final bookingDetails = ''.obs;

  var isLoading = false.obs;
  final RideService rideService = RideService();

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
    generateCars();
  }

  Future<void> loadAddresses() async {
    final String response = await rootBundle.loadString('assets/address.json');
    final data = json.decode(response);
    addresses.value = List<Map<String, dynamic>>.from(data['addresses']);
  }

  void generateCars() {
    List<String> carNames = [
      'Sedan',
      'SUV',
      'Convertible',
      'Coupe',
      'Hatchback'
    ];
    Random random = Random(); // Create an instance of Random
    cars.value = List.generate(5, (index) {
      // Ensure price ranges from 100 to 500
      int price = 100 +
          random.nextInt(401); // Random number between 0 and 400, then add 100
      return {
        'name': carNames[index],
        'price': price,
      };
    });
  }

  Future<void> calculateAndBookRide() async {
    isLoading.value = true;
    try {
      if (pickupLocation.value != null &&
          dropoffLocation.value != null &&
          selectedCar.value != null) {
        bookingDetails.value = await rideService.calculateRideDetails(
          lon1: pickupLocation.value!['longitude'],
          lat1: pickupLocation.value!['latitude'],
          lon2: dropoffLocation.value!['longitude'],
          lat2: dropoffLocation.value!['latitude'],
          userName: userName.value,
          email: email.value,
          contactNumber: contactNumber.value,
          pickupAddress: pickupLocation.value!['address'],
          dropoffAddress: dropoffLocation.value!['address'],
          carName: selectedCar.value!['name'],
          carPrice: selectedCar.value!['price'],
        );
      } else {
        bookingDetails.value = 'Please select all options before booking.';
      }
    } catch (e) {
      bookingDetails.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
