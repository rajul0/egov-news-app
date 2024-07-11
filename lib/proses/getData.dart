import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> ambilBerita(banyakBerita) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/feeds?limit=${banyakBerita}&&page=1'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data["data"];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List> ambilBeritaInong(banyakBerita) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/inong?limit=${banyakBerita}'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data["data"];
  } else {
    throw Exception('Failed to load data');
  }
}
