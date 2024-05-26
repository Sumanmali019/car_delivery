import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationDropdown extends StatelessWidget {
  const LocationDropdown({
    Key? key,
    required this.label,
    required this.locationObs,
    required this.locationsList,
  }) : super(key: key);

  final String label;
  final Rxn<Map<String, dynamic>> locationObs;
  final RxList<Map<String, dynamic>> locationsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Obx(() => DropdownButton<Map<String, dynamic>>(
              isExpanded: true,
              value: locationObs.value,
              hint: Text('Choose a location'),
              onChanged: (newValue) => locationObs.value = newValue,
              items: locationsList.map((location) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: location,
                  child: Text(location['address']),
                );
              }).toList(),
            )),
        const SizedBox(height: 10),
      ],
    );
  }
}
