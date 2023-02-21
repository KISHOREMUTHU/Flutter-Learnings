import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/constants.dart' as constant;
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch:Colors.blue,
      ),
      home: const MyHomePage(title: ""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   Future<List<dynamic>>? response;
  @override
  void initState() {
    response= futureUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size? size =  MediaQuery.of(context).size;


    return Scaffold(

      body: Center(
         child: GestureDetector(
           onTap: postRequest,
           child: Text("Post"),
         ),
      ),
        );
  }
  Future<List<dynamic>>? futureUsers() async{
    var result = await http.get(Uri.parse("https://ev-trending-toprated.onrender.com/postcar"));
    return jsonDecode(result.body);
  }
  void postRequest() async{
    final uri = Uri.parse('https://ev-trending-toprated.onrender.com/postcar');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {  "brand": "SVCE ECE",
      "model": "SVCE ECE EV",
      "range_km": 306,
      "topspeed_km": 80,
      "battery_pack_kwh": 26,
      "accelsec": 11.4,
      "rfficiency_whkm": 205,
      "fastcharge_kmh": 190,
      "rapidcharge": "Yes",
      "powertrain": "AWD",
      "plugtype": "Type 2 CCS",
      "bodystyle": "Sedan",
      "segment": "D",
      "seats": 5,
      "picture_url": "https://cars.usnews.com/images/article/201712/127376/1-_concept_vw_ID.Space_vizzion_DB2019AU01600_large_Cropped.jpg",
      "pollutionDegree": "51%",
      "chargingTIme": 6,
      "topSpeedComp": 14,
      "fuelCost": 2,
      "priceINR": "₹990,000.00",
      "priceSouthAfricanRand": "₹209,060.42",
      "priceEuro": "€11,738.62",
      "tax_credit": "",
      "TCO": "15.33"};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    String responseBody = response.body;
   print(responseBody);

  }


}
