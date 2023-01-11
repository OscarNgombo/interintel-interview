import 'dart:async';
import 'package:http/http.dart' as http;

// url variable of the network call
const url = "https://jsonplaceholder.typicode.com/todos?_limit=5";

//making a url call to collect the json data
class API {
  static Future getToDO() {
    return http.get(Uri.parse(url));
  }
}
