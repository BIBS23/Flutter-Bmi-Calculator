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
        val = bmival.toStringAsFixed(2);
      });
    }

    @override
    TextEditingController heightinput = TextEditingController();
    TextEditingController weightinput = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Bmi Calculator')),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(height: 20),
            BmiMeter(value: val),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MeasurementCard(
                  color: Colors.white,
                  controller: heightinput,
                  label: 'Height',
                ),
                MeasurementCard(
                  color: Colors.white,
                  controller: weightinput,
                  label: 'Weight',
                ),
              ],
            ),
            const SizedBox(height: 50),
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
                  backgroundColor:
                  MaterialStatePropertyAll(Colors.grey.shade700)),
                  child:
                  const Text('Calculate', style: TextStyle(fontSize: 13))),
            ),
            const SizedBox(height: 50),
            isbtnclicked
                ? Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 7)
                      ]),
                  child: Row(
                    children: [
                      const Text('BMI : ',
                        style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                      Text(val,
                        style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ) : const Offstage(),
          ],
        ),
      ),
    );
  }
}
