// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class getAPI {

//   Future getData() {
//   String url = 'https://parseapi.back4app.com/classes/Marker';
//     http.Response response = http.get(Uri(url));
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       return data;
//     } else {
//       return Future.error(e);
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:map_project/AddMarker.dart';

class ApiService {
  Future getData() async {
    try {
      var url = Uri.parse('https://parseapi.back4app.com/classes/Marker');
      var response = await http.get(url, headers: {
        'X-Parse-Application-Id': 'AJcDEc8WH8EbuDxxEOL2qeCtH1ymfLiQu5VnAKMK',
        'X-Parse-REST-API-Key': 'Ok5bl288H0PHqotjyzpJK61bfmtRYHU15Sy9Jlq1'
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future postdata() async {
    var url = Uri.parse('https://parseapi.back4app.com/classes/Marker');
    var data = {
      'NomMarker': 'NomMarker',
      'DescriptionMarker': 'Description',
      'longitude': 25,
      'latitude': 30,
      'statut': '',
    };
    var body = jsonEncode(data);

    // final NomMarker = controllerNomMarker.text.trim();
    // final DescriptionMarker = controllerDescriptionMarker.text.trim();
    // final longitude = controllerlongitude.text.trim();
    // final latitude = controllerlatitude.text.trim();
    // final statut = controllerstatut.text.trim();
    // final date_add = controllerdate_add.text.trim();

    var response = await http.post(url,
        headers: {
          'X-Parse-Application-Id': 'AJcDEc8WH8EbuDxxEOL2qeCtH1ymfLiQu5VnAKMK',
          'X-Parse-REST-API-Key': 'Ok5bl288H0PHqotjyzpJK61bfmtRYHU15Sy9Jlq1',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: body);

    return response;
  }
}
