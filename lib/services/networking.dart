import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;


  //we had to parse the URL into an URI to pass it in the get method
  //the http before the http methods helps developers identify that the data they are getting is from the http method
  //as the structure can sometimes look like a user defined method.
  //the jsonDecode method allow us to decode and access json formatted data
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
