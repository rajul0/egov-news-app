import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpotlightComponent extends StatefulWidget {
  const SpotlightComponent({super.key});

  @override
  State<SpotlightComponent> createState() => _SpotlightComponentState();
}

class _SpotlightComponentState extends State<SpotlightComponent> {
  List imageSliders = [
    "assets/gambar/sampel-news-1.jpg",
    "assets/gambar/sampel-news-2.jpg",
    "assets/gambar/sample-news-3.jpg",
  ];

  List judulBerita = [
    "Wujudkan Generasi Sehat Dan Cerdas Melalui Upaya Peningkatan Skrining Layak Hamil Dan Pelayanan ANC Terintegrasi",
    "JAUHI NARKOTIKA DI LINGKUNGAN DISDIKBUD",
    "Sekretaris Disdikbud Banda Aceh Buka Sosialisasi Anti Korupsi dan Gratifikasi"
  ];

  List penulis = ["DINKESKOTA", "Disdikbud", "ADMIN2"];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              viewportFraction: 1,
              autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
              onPageChanged: (index, reason) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            items: imageSliders.map((imagePath) {
              int index = imageSliders.indexOf(imagePath);
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(imagePath),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              judulBerita[index],
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
                              "by ${penulis[index]}",
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
              children: imageSliders.asMap().entries.map((entry) {
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
    );
  }
}
