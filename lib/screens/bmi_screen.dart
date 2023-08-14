import 'package:atelier02_ui/shared/MenuBottom.dart';
import 'package:atelier02_ui/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();

  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please Insert your height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please Insert your weight in ${(isMetric) ? 'Kilos' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: ToggleButtons(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Metric',
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Imperial',
                        style: TextStyle(fontSize: fontSize),
                      ),
                    )
                  ],
                  isSelected: isSelected,
                  onPressed: toggleMeasure,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: TextField(
                    controller: txtWeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: weightMessage)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                    onPressed: findBMI,
                    child: Text(
                      'Calculate BMI',
                      style: TextStyle(fontSize: fontSize),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  result,
                  style: TextStyle(fontSize: fontSize),
                ),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(index) {
    if (index == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
}
