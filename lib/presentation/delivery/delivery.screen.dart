import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/delivery.controller.dart';

class DeliveryScreen extends GetView<DeliveryController> {
  const DeliveryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliveryScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
