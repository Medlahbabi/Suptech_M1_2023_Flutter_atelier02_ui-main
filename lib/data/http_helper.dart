import 'dart:convert';

import 'package:atelier02_ui/data/weather.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'weatherapi-com.p.rapidapi.com';
  final String path = '/current.json';
  final apiKey = '549cce3e1dmsh0a2bf8002ca43d4p126286jsn5c6264ca98a0';
  final apiHost = 'weatherapi-com.p.rapidapi.com';

  Future<Weather> getWeather(String location) async {
    Map<String, String> parameters = {'q': location};
    Uri uri = Uri.https(authority, path, parameters);
    Map<String, String> headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost
    };
    http.Response result = await http.get(uri, headers: headers);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
