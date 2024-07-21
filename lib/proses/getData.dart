import 'dart:convert';
import 'package:egov_news_app/proses/parsingData.dart';
import 'package:http/http.dart' as http;

Future<List> ambilBerita(banyakBerita, {pageKey = 1}) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/feeds?limit=${banyakBerita}&&page=${pageKey}'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List clearData = [];
    for (var i in data["data"]) {
      if (i["image"] == "###") {
        var gambarKonten = await ambilGambarKonten(i["link"]);

        i["image"] = gambarKonten;

        clearData.add(i);
      } else {
        clearData.add(i);
      }
    }
    return clearData;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List> ambilBeritaInong(banyakBerita) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/inong?limit=${banyakBerita}'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List clearData = [];
    for (var i in data["data"]) {
      if (i["image"] == "###") {
        var gambarKonten = await ambilGambarKonten(i["link"]);

        i["image"] = gambarKonten;

        clearData.add(i);
      } else {
        clearData.add(i);
      }
    }
    return clearData;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List> ambilBeritaAgam(banyakBerita) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/agam?limit=${banyakBerita}'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List clearData = [];
    for (var i in data["data"]) {
      if (i["image"] == "###") {
        var gambarKonten = await ambilGambarKonten(i["link"]);

        i["image"] = gambarKonten;

        clearData.add(i);
      } else {
        clearData.add(i);
      }
    }
    return clearData;
  } else {
    throw Exception('Failed to load data');
  }
}
