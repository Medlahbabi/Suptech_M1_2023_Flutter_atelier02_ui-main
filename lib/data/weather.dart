class Weather {
  String conditionText = '';
  String winDir = '';
  double temperature = 0;
  double feelslike = 0;
  double pressure = 0;
  int humidity = 0;

  Weather(this.conditionText, this.winDir, this.temperature, this.feelslike,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    conditionText = weatherMap['current']['condition']['text'];
    temperature = (weatherMap['current']['temp_c']) ?? 0;
    feelslike = (weatherMap['current']['feelslike_c']) ?? 0;
    winDir = weatherMap['current']['wind_dir'];
    pressure = (weatherMap['current']['pressure_mb']) ?? 0;
    humidity = (weatherMap['current']['humidity']) ?? 0;
  }
}
