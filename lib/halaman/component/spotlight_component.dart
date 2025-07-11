import 'package:animations/animations.dart';
import 'package:sinergi/halaman/halaman_detail_berita/halaman_detail_berita.dart';
import 'package:sinergi/proses/get_data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class SpotlightComponent extends StatefulWidget {
  final String jenisBerita;
  const SpotlightComponent({Key? key, required this.jenisBerita});

  @override
  State<SpotlightComponent> createState() => _SpotlightComponentState();
}

class _SpotlightComponentState extends State<SpotlightComponent> {
  var _selectedIndex = 0;

  List? dataBerita;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    if (widget.jenisBerita == "SINERGI") {
      dataBerita = await ambilBerita(3);
    } else if (widget.jenisBerita == "INONG") {
      dataBerita = await ambilBeritaInong(3);
    } else if (widget.jenisBerita == "AGAM") {
      dataBerita = await ambilBeritaAgam(3);
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: 180.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFBDBDBD),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      bottom: 30.0,
                      left: 10.0,
                      child: Container(
                        width: 290.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                width: double.infinity,
                                height: 52.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                width: 100.0,
                                height: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : OpenContainer(
            closedElevation: 0.0,
            openElevation: 0.0,
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: Duration(milliseconds: 500),
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return InkWell(
                onTap: openContainer,
                borderRadius: BorderRadius.circular(15.0),
                child: Ink(
                  height: 180.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFBDBDBD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          viewportFraction: 1,
                          autoPlayCurve:
                              Curves.fastOutSlowIn, // Animation curve
                          onPageChanged: (index, reason) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                        items: dataBerita!.map((imagePath) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  dataBerita![_selectedIndex]["image"],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF1A434E),
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
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
                                Container(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                Positioned(
                                  bottom: 30.0,
                                  left: 10.0,
                                  child: Container(
                                    width: 290.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataBerita![_selectedIndex]["title"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                        Text(
                                          "by ${dataBerita![_selectedIndex]["organization_name"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 25.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: dataBerita!.asMap().entries.map((entry) {
                            int index = entry.key;
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: index == _selectedIndex
                                  ? 30.0
                                  : 8.0, // Set width based on selected index
                              height: 8.0,
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    index == _selectedIndex ? 15.0 : 50.0),
                                shape: BoxShape.rectangle,
                                color: index == _selectedIndex
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFFFFFF).withOpacity(0.2),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            openBuilder: (context, action) {
              return HalamanDetailBerita(
                gambarBerita: dataBerita![_selectedIndex]["image"],
                judulBerita: dataBerita![_selectedIndex]["title"],
                url: dataBerita![_selectedIndex]["link"],
                penulis: dataBerita![_selectedIndex]["organization_name"],
              );
            },
          );
  }
}
