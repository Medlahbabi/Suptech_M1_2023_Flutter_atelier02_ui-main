import 'package:atelier02_ui/data/http_helper.dart';
import 'package:atelier02_ui/data/weather.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                        onPressed: getData, icon: const Icon(Icons.search))),
              ),
            ),
            weatherRow('Place', txtPlace.text),
            weatherRow('Condition', result.conditionText),
            weatherRow('Temperature', result.temperature.toStringAsFixed(2)),
            weatherRow('Feelslike', result.feelslike.toStringAsFixed(2)),
            weatherRow('Pressure', result.pressure.toStringAsFixed(2)),
            weatherRow('Humidity', result.humidity.toString()),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).hintColor),
                )),
            Expanded(
                flex: 4,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ))
          ],
        ));
    return row;
  }
}
