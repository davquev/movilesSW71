import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiBaseHelper{
  final String baseUrl = 'https://pokeapi.co/api/v2/';

  Future<dynamic> get(String url) async{
    var responseJson;
    try{
      final response = await http.get(baseUrl + url);
      responseJson = json.decode(response.body.toString());
    } on SocketException{
      print('Connection error!');
    }
    return responseJson;
  }
}