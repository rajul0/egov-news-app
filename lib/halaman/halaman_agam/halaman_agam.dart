import 'package:animations/animations.dart';
import 'package:sinergi/halaman/berita_selengkapnya.dart';
import 'package:sinergi/halaman/component/berita_baru_card.dart';
import 'package:sinergi/halaman/component/spotlight_component.dart';
import 'package:sinergi/halaman/halaman_detail_berita/halaman_detail_berita.dart';
import 'package:sinergi/proses/get_data.dart';
import 'package:flutter/material.dart';

class HalamanAgam extends StatefulWidget {
  const HalamanAgam({super.key});

  @override
  State<HalamanAgam> createState() => _HalamanAgamState();
}

class _HalamanAgamState extends State<HalamanAgam> {
  Key _key = UniqueKey();

  Future<void> _refresh() async {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        color: Color(0xFFBDBDBD),
        backgroundColor: Color(0xFFFFFFFF),
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 50.0,
              right: 24.0,
              bottom: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang di",
                        style: TextStyle(
                            color: Color(0xFF95A6AA),
                            fontFamily: "Mulish",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Agregator Gampong (AGAM)",
                        style: TextStyle(
                          color: Color(0xFF1A434E),
                          fontFamily: "Mulish",
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                SpotlightComponent(
                  jenisBerita: "AGAM",
                ),
                SizedBox(
                  height: 32.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Temukan Berita Terbaru",
                              style: TextStyle(
                                color: Color(0xFF1A434E),
                                fontFamily: "Mulish",
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      FutureBuilder<void>(
                        future: ambilBeritaAgam(15),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Color(0xFF1A434E),
                            ));
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            List data = snapshot.data as List;
                            return Column(
                              children: List.generate(data.length, (index) {
                                return OpenContainer(
                                  closedElevation: 0.0,
                                  openElevation: 0.0,
                                  transitionType:
                                      ContainerTransitionType.fadeThrough,
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  closedBuilder: (BuildContext context,
                                      VoidCallback openContainer) {
                                    return Column(
                                      children: [
                                        beritaBaruCard(
                                          context,
                                          data[index]['image'],
                                          data[index]['title'],
                                          data[index]['organization_name'],
                                          openContainer,
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                      ],
                                    );
                                  },
                                  openBuilder: (context, action) {
                                    return HalamanDetailBerita(
                                      gambarBerita: data[index]["image"],
                                      judulBerita: data[index]["title"],
                                      penulis: data[index]["organization_name"],
                                      url: data[index]["link"],
                                    );
                                  },
                                );
                              }),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HalamanBeritaSelengkapnya(
                                jenisBerita: "AGAM",
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Berita Lainnya",
                          style: TextStyle(
                              color: Color(0xFF95A6AA),
                              fontFamily: "Mulish",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
