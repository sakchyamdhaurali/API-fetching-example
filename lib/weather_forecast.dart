import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:navigation_page/network_helper.dart';
import 'package:navigation_page/weather_model.dart';


class WeatherForecast extends StatefulWidget {

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

Future <WeatherNews>? _weatherData;


@override
  void initState() {
    // TODO: implement initState
    _weatherData = getWeatherDataApi();
    print(_weatherData);
    super.initState();
  }

  Future <WeatherNews> getWeatherDataApi() async{
    NetworkHelper networkHelper= NetworkHelper();
    return await networkHelper.getWeatherNews();

  }





  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('WeatherApp'),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<WeatherNews>(
            future: _weatherData,

            builder: (context,snapshot)
            
            {

              String convertKelvinToDegree(){
                 
                  double kValueInDouble= snapshot.data!.main.temp;

                double celciusValue;
                String celciusValueInString;
                  celciusValue = kValueInDouble - 273.15;
                  celciusValueInString = celciusValue.toStringAsFixed(2);
                  return celciusValueInString;
                }

                    if(snapshot.hasData){
                         return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
        
                  Text(snapshot.data!.weather[0].main,
                   style: TextStyle(
                    fontSize: 19),
                    ),
                    SizedBox(height: 20,),
                    Text(snapshot.data!.name, style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),),
        
                    SizedBox(height: 10,),
        
                    Text(convertKelvinToDegree(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 ),),
        
        
                  ],
                  );
                    }
                    else{
                      return CircularProgressIndicator.adaptive();
                    }
                    

                 
                }),
              ),
      ),
    );
            }
          
}