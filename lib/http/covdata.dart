import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Data> fetchData() async{
  final response = await http.get('https://corona.lmao.ninja/v2/countries/india');

  if(response.statusCode == 200) {
    return Data.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

class Data {
  final int infected;
  final int died;
  final int recovered;

  Data({this.infected, this.died, this.recovered});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      infected: json['cases'],
      died: json['deaths'],
      recovered: json['recovered']
    );
  }  
}