import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiMeter extends StatelessWidget {
  final String value;
  const BmiMeter({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ]),
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
            GaugeRange(
              startWidth: 23,
              endWidth: 23,
              startValue: 0,
              endValue: 18.5,
              gradient: SweepGradient(colors: [
                Colors.red.shade400,
                Colors.blue.shade400,
              ]),
              label: 'Underweight',
            ),
            GaugeRange(
              startWidth: 23,
              endWidth: 23,
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.pink.shade300,
              label: 'Normal',
            ),
            GaugeRange(
              startWidth: 23,
              endWidth: 23,
              startValue: 25,
              endValue: 29.9,
              color: Colors.deepPurple.shade300,
              label: 'Overweight',
            ),
            GaugeRange(
                startWidth: 23,
                endWidth: 23,
                startValue: 30,
                endValue: 40,
                gradient: SweepGradient(colors: [
                  Colors.blue.shade400,
                  Colors.red.shade400,
                ]),
                label: 'Obesity',
                labelStyle: GaugeTextStyle())
          ], pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              animationType: AnimationType.easeInCirc,
              value: double.parse(value),
              knobStyle: const KnobStyle(
              color: Colors.white, borderWidth: 50, knobRadius: 0.3),
            ),
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 55,
              positionFactor: 0.3,
              widget: Text(value,
                  style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ]),
        ]));
  }
}
