import 'package:bmicalculator/utils/bmi_meter.dart';
import 'package:bmicalculator/utils/measurements_cards.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isbtnclicked = false;
  String val = 0.toString();
  Widget build(BuildContext context) {
    void calc(double height, double weight) {
      double bmival = weight / (height * height / 10000);
      setState(() {
        val = bmival.toStringAsFixed(1);
      });
    }

    @override
    TextEditingController heightinput = TextEditingController();
    TextEditingController weightinput = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(letterSpacing: 4),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90),
            BmiMeter(value: val),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MeasurementCard(
                  color: Colors.white,
                  controller: heightinput,
                  label: 'Height',
                  suffix: 'Cm',
                ),
                MeasurementCard(
                  color: Colors.white,
                  controller: weightinput,
                  label: 'Weight',
                  suffix: 'Kg',
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    double h = double.parse(heightinput.text);
                    double w = double.parse(weightinput.text);
                    calc(h, w);
                    setState(() {
                      isbtnclicked = !isbtnclicked;
                    });
                  },
                  style: ButtonStyle(
                      shadowColor: const MaterialStatePropertyAll(Colors.pink),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)))),
                  child: Text('Calculate',
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600))),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
