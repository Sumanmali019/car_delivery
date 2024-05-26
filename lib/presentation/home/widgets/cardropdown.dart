import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class CarDropdown extends StatelessWidget {
  const CarDropdown({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select a Car',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Obx(() => DropdownButton<Map<String, dynamic>>(
              isExpanded: true,
              value: controller.selectedCar.value,
              hint: const Text('Choose a car'),
              onChanged: (newValue) => controller.selectedCar.value = newValue,
              items: controller.cars.map((car) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: car,
                  child: Text('${car['name']} - Rs ${car['price']}'),
                );
              }).toList(),
            )),
        const SizedBox(height: 10),
      ],
    );
  }
}
