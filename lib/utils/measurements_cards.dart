import 'package:flutter/material.dart';

class MeasurementCard extends StatelessWidget {
  final color;
  final label;
  final TextEditingController controller;
  const MeasurementCard(
      {super.key, required this.color, required this.controller,
      required this.label
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7
          )
        ],
      borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          controller: controller,
          decoration: InputDecoration(
            label: Center(child: Text(label)),
            labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
