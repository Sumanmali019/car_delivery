import 'package:car_delivery/presentation/home/widgets/cardropdown.dart';
import 'package:car_delivery/presentation/home/widgets/locationdrop.dart';
import 'package:car_delivery/presentation/home/widgets/userdretails.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KD Ride Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocationDropdown(
                  label: 'Select Pickup',
                  locationObs: controller.pickupLocation,
                  locationsList: controller.addresses),
              LocationDropdown(
                  label: 'Select Dropoff',
                  locationObs: controller.dropoffLocation,
                  locationsList: controller.addresses),
              CarDropdown(controller: controller),
              UserDetailsInput(controller: controller),
              ElevatedButton(
                onPressed: () => controller.calculateAndBookRide(),
                child: const Text('Calculate & Book'),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.isLoading.isTrue) {
                  return const Center(
                    child: CircularProgressIndicator(), // Loading indicator
                  );
                } else {
                  return Text(
                    'Booking Details: \n${controller.bookingDetails.value}',
                    style: const TextStyle(fontSize: 16),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
