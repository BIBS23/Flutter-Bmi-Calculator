import 'package:flutter/material.dart';

class MeasurementCard extends StatelessWidget {
  final color;
  final label;
  final TextEditingController controller;
  const MeasurementCard(
      {super.key,
      required this.color,
      required this.controller,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.pink.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          controller: controller,
          decoration: InputDecoration(
            suffix: Text(label,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
