import 'package:flutter/material.dart';

import '../controllers/home.controller.dart';

class UserDetailsInput extends StatelessWidget {
  const UserDetailsInput({Key? key, required this.controller})
      : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: (value) => controller.userName.value = value,
          decoration: const InputDecoration(
            labelText: 'Your Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) => controller.contactNumber.value = value,
          decoration: const InputDecoration(
            labelText: 'Contact Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) => controller.email.value = value,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
