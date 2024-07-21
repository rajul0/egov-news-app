import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<String> fetchHtml(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load page');
  }
}

Future<String> ambilGambarKonten(String url) async {
  String htmlParse = await fetchHtml(url);
  String imgParse = "";
  final document = parse(htmlParse);
  String domain = Uri.parse(url).host;

  final contentDiv = document.querySelector('div#content');
  if (contentDiv != null) {
    final images = contentDiv.querySelectorAll('img');
    for (var img in images) {
      final src = img.attributes['src'];
      if (imgParse == "") {
        if (src != null &&
            src.contains(domain) &&
            (src.endsWith('.png') ||
                src.endsWith('.jpg') ||
                src.endsWith('.jpeg'))) {
          imgParse = src;
        }
      }
    }
    return imgParse;
  } else {
    print('No content div found');
    return "";
  }
}
