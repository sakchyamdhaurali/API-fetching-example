import 'package:flutter/material.dart';
import 'package:navigation_page/weather_forecast.dart';

import 'FirstScreen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}