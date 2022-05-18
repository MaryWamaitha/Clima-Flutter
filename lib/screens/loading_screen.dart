import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  //this method is called when our stateful widget is created.
  //the following method inside our init allows us to print position as soon as screen is loaded
  //NB: Initstate is only called once
  void initState() {
    super.initState();
    getLocationData();
  }

  //we can tap into this
  void getLocationData() async {
    WeatherModel model = WeatherModel();
    var weatherData = await model.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      //the variable weatherData is being passed to the next page
      //step 1 in passing it over
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDancingSquare(
          color: Colors.blueGrey,
          size: 100,
        ),
      ),
    );
  }
}
