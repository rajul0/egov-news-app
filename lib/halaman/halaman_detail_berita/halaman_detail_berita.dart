import 'package:egov_news_app/proses/get_data.dart';
import 'package:flutter/material.dart';

class HalamanDetailBerita extends StatefulWidget {
  final String gambarBerita;
  final String judulBerita;
  final String penulis;
  final String url;

  const HalamanDetailBerita({
    Key? key,
    required this.gambarBerita,
    required this.judulBerita,
    required this.penulis,
    required this.url,
  });

  @override
  State<HalamanDetailBerita> createState() => _HalamanDetailBeritaState();
}

class _HalamanDetailBeritaState extends State<HalamanDetailBerita> {
  bool isMounted = true;

  Map konten = {
    "konten_teks": "",
    "gambar_konten": [],
  };
  bool isLoading = true;

  @override
  void initState() {
    fetchData(widget.url);
    super.initState();
  }

  @override
  void dispose() {
    isMounted = false;
    super.dispose();
  }

  Future<void> fetchData(url) async {
    try {
      var data = await ambilKontenBerita(url);
      if (isMounted) {
        setState(() {
          konten = data;
          isLoading = false;
        });
      }
    } catch (e) {
      if (isMounted) {
        setState(() {
          isLoading = false;
        });
      }
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 370.0,
              decoration: BoxDecoration(
                color: Color(0xFFBDBDBD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Color(0xFF1A434E),
                          ))
                        : Image.network(
                            konten["gambar_konten"] == []
                                ? konten["gambar_konten"][0]
                                : widget.gambarBerita,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF1A434E),
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/gambar/news-thumbnail.png",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 24.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(50.0),
                      child: Ink(
                        child: Image.asset(
                          "assets/gambar/back-logo.png",
                          width: 54.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24.0,
                    left: 24.0,
                    child: Container(
                      width: screenWidth - 48.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.judulBerita,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "By ${widget.penulis}",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Mulish",
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                top: 30.0,
                right: 24.0,
              ),
              child: Column(
                children: [
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Color(0xFF1A434E),
                        ))
                      // ignore: unnecessary_null_comparison
                      : konten == null
                          ? Center(child: Text('Failed to load content'))
                          : Text(
                              konten["konten_teks"],
                              style: TextStyle(
                                color: Color(0xFF95A6AA),
                                fontSize: 14.0,
                                fontFamily: 'Mulish',
                              ),
                              textAlign: TextAlign.justify,
                            ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
