import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Data> fetchData(String country) async{
  final response = await http.get('https://corona.lmao.ninja/v2/countries/$country');

  if(response.statusCode == 200) {
    return Data.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

// Future<Countries> fetchCountries() async {
//   final response = await http.get('https://corona.lmao.ninja/v2/countries/');

//   if(response.statusCode == 200) {
//     return 
//   }
// }

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

// class Countries {
//   final List<String> countryList;

//   Countries(this.countryList);

//   factory Countries.fromJson(Map<String, dynamic> json) {
//     return Countries(
//       for (var country in json) {
//         countryList.
//       } 
//     );
//   }

// }