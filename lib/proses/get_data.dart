import 'dart:convert';
import 'package:egov_news_app/proses/parsing_data.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

Future<List> ambilBerita(banyakBerita, {pageKey = 1}) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/feeds?limit=$banyakBerita&&page=$pageKey'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List clearData = [];
    for (var i in data["data"]) {
      if (i["image"] == "###") {
        var gambarKonten = "assets/gambar/news-thumbnail.png";
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

Future<List> ambilBeritaInong(banyakBerita, {pageKey = 1}) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/inong?limit=$banyakBerita&&page=$pageKey'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List clearData = [];
    for (var i in data["data"]) {
      if (i["image"] == "###") {
        var gambarKonten = "assets/gambar/news-thumbnail.png";

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

Future<List> ambilBeritaAgam(banyakBerita, {pageKey = 1}) async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/agam?limit=$banyakBerita&&page=$pageKey'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List clearData = [];
    for (var i in data["data"]) {
      if (i["image"] == "###") {
        var gambarKonten = "assets/gambar/news-thumbnail.png";

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

Future<Map> ambilKontenBerita(String url) async {
  try {
    Element? contentDiv;

    Map kontenBerita = {
      "konten_teks": "",
      "gambar_konten": [],
    };

    List gambarKonten = [];
    String htmlParse = await fetchHtml(url);
    final document = parse(htmlParse);

    if (url.contains("rsum.bandaacehkota.go.id")) {
      contentDiv = document.querySelector('div.med_single_content');
    } else if (url.contains("disdukcapil.bandaacehkota.go.id") ||
        url.contains("disnaker.bandaacehkota.go.id")) {
      contentDiv = document.querySelector('div.post-content');
    } else if (url.contains("dishub.bandaacehkota.go.id")) {
      contentDiv = document.querySelector('div.col-md-12');
    } else if (url.contains("iemasenuleekareng.gampong.id")) {
      contentDiv = document.querySelector('div.news-content');
    } else if (url.contains("disdikbud.bandaacehkota.go.id")) {
      contentDiv =
          document.querySelector('div.bs-blog-post')!.querySelector("article");
    } else if (url.contains("bappeda.bandaacehkota.go.id")) {
      contentDiv = document.querySelector('div.post-content-inner');
    } else {
      contentDiv = document.querySelector('div.entry-content');
    }

    if (contentDiv != null) {
      StringBuffer buffer = StringBuffer();

      final semuaKonten = contentDiv.querySelectorAll('p');

      for (var konten in semuaKonten) {
        // ambil gambar konten jika ada
        if (konten.children.isNotEmpty) {
          for (var child in konten.children) {
            if (child.localName == "img") {
              final src = child.attributes['src'];
              gambarKonten.add(src);
            }
          }
        }

        buffer.write(konten.text); // tulis teks dalam tag p ke buffer

        // tambah spasi baris ke buffer
        if (!buffer.toString().endsWith('\n\n')) {
          buffer.write('\n\n');
        }
      }
      kontenBerita["konten_teks"] = buffer.toString();
      kontenBerita["gambar_konten"] = gambarKonten;

      return kontenBerita;
    } else {
      kontenBerita["konten_teks"] =
          "Situs tidak punya konten atau template error";

      return kontenBerita;
    }
  } catch (e) {
    return {"konten_teks": e.toString()};
  }
}
