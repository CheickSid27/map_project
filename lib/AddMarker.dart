import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';

import 'package:flutter_map/flutter_map.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:http/http.dart' as http;

import 'authentification/Requetes.dart';
import 'authentification/sign up.dart';

class AddMarkerPage extends StatelessWidget {
  const AddMarkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddMarker(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'AJcDEc8WH8EbuDxxEOL2qeCtH1ymfLiQu5VnAKMK';
  final keyClientKey = '55Fwl0zM5yoIq4XWXBHyl1oIhbzhB1bxcY8GXs6z';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  // var headers = {
  //   'accept': 'application/json',
  //   'X-Parse-Application-Id': 'AJcDEc8WH8EbuDxxEOL2qeCtH1ymfLiQu5VnAKMK',
  //   'X-Parse-REST-API-Key': 'Ok5bl288H0PHqotjyzpJK61bfmtRYHU15Sy9Jlq1',
  //   'Content-Type': 'application/json',
  // };

  // var data =
  //     '{\n  "NomMarker": "A  string",\n  "DescripMarker": "A string",\n  "longitude": 1,\n  "latitude": 1,\n  "statuts": true,\n  "date_add": {\n    "__type": "Date",\n    "iso": "2018-11-06T18:02:52.249Z"\n  }\n}';

  // var url = Uri.parse('https://parseapi.back4app.com/classes/Marker');
  // var res = await http.post(url, headers: headers, body: data);
  // if (res.statusCode != 200)
  //   throw Exception('http.post error: statusCode= ${res.statusCode}');
  // print(res.body);
  // var firstObject = ParseObject('AddMarker');
  // await firstObject.save();
}

class AddMarker extends StatefulWidget {
  const AddMarker({super.key});

  @override
  State<AddMarker> createState() => _AddMarkerState();
}

class _AddMarkerState extends State<AddMarker> {
  ApiService apiService = ApiService();

  final controllerNomMarker = TextEditingController();
  final controllerDescriptionMarker = TextEditingController();
  final controllerlongitude = TextEditingController();
  final controllerlatitude = TextEditingController();
  final controllerstatut = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    doAddMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ADD NEW MARKER',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 250,
                    child: Image.asset('assets/icon.png'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: controllerNomMarker,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Marker name'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controllerDescriptionMarker,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Descript your marker'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controllerlongitude,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Longitude'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controllerlatitude,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Latitude'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controllerstatut,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Statut'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 150,
                      right: 150,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(244)),
                      height: 50,
                      child: TextButton(
                        child: const Text(
                          'ADD',
                          style: TextStyle(fontSize: 21),
                        ),
                        onPressed: () => doAddMarker(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void doAddMarker() async {
    final NomMarker = controllerNomMarker.text;
    // final DescriptionMarker = controllerDescriptionMarker.text.trim();
    // final longitude = controllerlongitude.text.trim();
    // final latitude = controllerlatitude.text.trim();
    // final statut = controllerstatut.text.trim();
    // final date_add = controllerdate_add.text.trim();

    // final ParseUser user =
    //     ParseUser(null, null, controllerlongitude.text.trim());

    var response = await apiService.postdata();
    if (response.success) {
      Message.showSuccess(
          context: context,
          message: 'User was successfully created!',
          onPressed: () async {});
    } else {
      Message.showError(context: context, message: response.error!.message);
    }
    print(response);
    //final user = ParseUser(NomMarker, DescriptionMarker,longitude, null);

    //var response = await Marker.();

    // if (response.success) {
    //   navigateToUser();
    // } else {
    //   Message.showError(context: context, message: response.error!.message);
    // }
    // final ParseResponse parseResponse = await Marker.();
  }
}
