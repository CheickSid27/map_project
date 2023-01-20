import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:map_project/map.dart';

import 'authentification/Requetes.dart';
import 'authentification/sign up.dart';
import 'AddMarker.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'AJcDEc8WH8EbuDxxEOL2qeCtH1ymfLiQu5VnAKMK';
  final keyClientKey = '55Fwl0zM5yoIq4XWXBHyl1oIhbzhB1bxcY8GXs6z';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
  runApp(SignUpScreen());
}

class mapproject extends StatelessWidget {
  const mapproject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'route',
      routes: {
        //'route 1': (context) => LLoginScreen(),
        //'route 2': (context) => SignUpScreen(),
        //'route 3': (context) => const fooddetailscreen(),
      },
      home: mapproject(),
    );
  }
}
