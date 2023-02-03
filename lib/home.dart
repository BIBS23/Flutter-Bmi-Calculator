import 'package:bmicalculator/utils/bmi_meter.dart';
import 'package:bmicalculator/utils/measurements_cards.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String val = 0.toString();
  var bmi = '';
  bool isbtnclicked = false;
  Widget build(BuildContext context) {
    @override
    void calc(double height, double weight) {
      double bmival = weight / (height * height / 10000);
      setState(() {
        val = bmival.toStringAsFixed(1);
      });
    }

    void result() {
      if (double.parse(val) <= 18.5) {
        setState(() {
          bmi = 'You are in UnderWeight range ';
        });
      } else if (double.parse(val) > 18.5 && double.parse(val) <= 24.9) {
        setState(() {
          bmi = 'You are in  Healty Weight range ';
        });
      } else if (double.parse(val) > 24.9 && double.parse(val) <= 30.0) {
        setState(() {
          bmi = 'You are in Over Weight range ';
        });
      } else {
        setState(() {
          bmi = 'You are in the Obese range ';
        });
      }
    }

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
            const SizedBox(height: 70),
            BmiMeter(value: val),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MeasurementCard(
                  color: Colors.white,
                  controller: heightinput,
                  label: 'CM',
                ),
                MeasurementCard(
                  color: Colors.white,
                  controller: weightinput,
                  label: 'KG',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Height',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400)),
                Text('Weight',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400))
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
                      result();

                      if (heightinput.text.isEmpty ||
                          weightinput.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Enter a valid input')));
                      } else {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: SizedBox(
                            height: 250,
                            child: Center(
                              child: SingleChildScrollView(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Lottie.network(
                                        'https://assets1.lottiefiles.com/packages/lf20_2m1smtya.json'),
                                    Positioned(
                                      top: 100,
                                      child: Text(
                                        bmi,
                                        style: const TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                      top: 140,
                                      child: Text(
                                        'BMI Range : $val',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          duration: const Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: ButtonStyle(
                        shadowColor:
                            const MaterialStatePropertyAll(Colors.pink),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                    child: Text('Calculate',
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600)))),
          ],
        ),
      ),
    );
  }
}
