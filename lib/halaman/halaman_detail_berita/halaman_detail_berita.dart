import 'package:flutter/material.dart';

class HalamanDetailBerita extends StatefulWidget {
  final String gambarBerita;
  final String judulBerita;
  final String berita;
  final String penulis;

  const HalamanDetailBerita({
    Key? key,
    required this.gambarBerita,
    required this.judulBerita,
    required this.berita,
    required this.penulis,
  });

  @override
  State<HalamanDetailBerita> createState() => _HalamanDetailBeritaState();
}

class _HalamanDetailBeritaState extends State<HalamanDetailBerita> {
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
                    child: Image.network(
                      widget.gambarBerita,
                      width: double.infinity,
                      fit: BoxFit.cover,
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
                            maxLines: 2,
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
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text("lorem ipsum"),
                  Text("lorem ipsum"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
