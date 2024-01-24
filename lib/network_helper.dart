
// import 'package:flutter/material.dart';


import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:navigation_page/weather_model.dart';


//POSTMAN LINK
//https://api.openweathermap.org/data/2.5/weather?lat=27.7172&lon=85.3240&appid=e5f001d6384ceb15b0c91d7965838d53


class NetworkHelper{
  

  Future<WeatherNews> getWeatherNews() async{
  var decodedData;


    //first line --> http.get(Uri.parse('URL'));

    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=27.7172&lon=85.3240&appid=e5f001d6384ceb15b0c91d7965838d53'));
  log(response.statusCode);
if(response.statusCode== 200){
//status OK successful

// print(response.body);

 decodedData = jsonDecode(response.body);
print(decodedData);
}

else if(response.statusCode==401){
//hamro side bata error


}
else if(response.statusCode== 500){
//server down



}
return WeatherNews.fromJson(decodedData);


  }

}