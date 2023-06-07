import 'dart:convert';
import '../model/album_model.dart';
import 'package:http/http.dart' as http;
Future<List<Album>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final List<dynamic> objectsJson = json.decode(response.body);
    return objectsJson.map((json) => Album.fromJson(json)).toList();
    // return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}