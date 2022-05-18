import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //we make this a future so that we can be able to return it on other pages but it needs
  //to be a future
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}


// var long = jsonDecode(data)['coord']['lon'];
// //if the item that we are accessing is not directly inside an id, we have to go inside a list in the id
// //you can also get the path using the copy path in json viewer;
// var weatherDescription = jsonDecode(data)['weather'][0]['description'];
// //to decode all the data at once, we use the method below
// //we can use the var dataType incase we are not sure what the subsequent data types are
// double temperature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];
// print(temperature);