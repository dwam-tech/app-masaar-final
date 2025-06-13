import 'package:flutter/material.dart';

class RestaurantAvailabilitySwitch extends StatelessWidget {
  final bool isAvailable;
  final ValueChanged<bool> onChanged;
  
  const RestaurantAvailabilitySwitch({
    super.key,
    required this.isAvailable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Switch(
            value: isAvailable,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
          const Text(
            "هل أنت متاح لاستلام الطلبات",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}