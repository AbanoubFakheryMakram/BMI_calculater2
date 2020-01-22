import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbi_calculator2/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MaterialApp(
        title: 'BMI Calculator',
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0a0e21),
          scaffoldBackgroundColor: Color(0xff0a0e21),
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  });
}
