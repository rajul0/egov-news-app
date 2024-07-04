import 'package:flutter/material.dart';

class HotNewsComponent extends StatefulWidget {
  const HotNewsComponent({super.key});

  @override
  State<HotNewsComponent> createState() => _HotNewsComponentState();
}

class _HotNewsComponentState extends State<HotNewsComponent> {
  List<String> kategoriBeritas = [
    "Politik",
    "Bisnis",
    "Investasi",
    "Lainnya",
  ];

  List<Map> daftarBerita = [
    {
      "id": 61212,
      "organization_id": 12,
      "published_at": "2024-07-04T05:00:00.000000Z",
      "title":
          "Dishub Banda Aceh Dinobatkan Sebagai Pengelolaan Website Terbaik",
      "link":
          "http://dishub.bandaacehkota.go.id/berita-dishub-banda-aceh-dinobatkan-sebagai-pengelolaan-website-terbaik.html",
      "organization_name": "Dishub",
      "image":
          "http://dishub.bandaacehkota.go.id/file/source/SNOW_20240703_222624_956%20(1).jpg",
      "created_at": "2024-07-04T09:02:46.000000Z",
      "updated_at": "2024-07-04T10:03:23.000000Z"
    },
    {
      "id": 61210,
      "organization_id": 46,
      "published_at": "2024-07-04T08:16:00.000000Z",
      "title": "Rapat Persiapan Expose DAK PPKT 2025",
      "link":
          "https://perkim.bandaacehkota.go.id/2024/07/04/rapat-persiapan-expose-dak-ppkt-2025/",
      "organization_name": "PERKIM",
      "image":
          "https://perkim.bandaacehkota.go.id/wp-content/uploads/sites/4/2024/07/WhatsApp-Image-2024-07-04-at-10.19.11-678x381.jpeg",
      "created_at": "2024-07-04T08:47:01.000000Z",
      "updated_at": "2024-07-04T15:01:31.000000Z"
    },
    {
      "id": 61211,
      "organization_id": 46,
      "published_at": "2024-07-04T08:11:00.000000Z",
      "title": "Pembuatan Tutup Saluran Lingkungan Banda Raya",
      "link":
          "https://perkim.bandaacehkota.go.id/2024/07/04/pembuatan-tutup-saluran-lingkungan-banda-raya/",
      "organization_name": "PERKIM",
      "image":
          "https://perkim.bandaacehkota.go.id/wp-content/uploads/sites/4/2024/07/WhatsApp-Image-2024-07-04-at-11.31.15-1-678x381.jpeg",
      "created_at": "2024-07-04T08:47:01.000000Z",
      "updated_at": "2024-07-04T15:01:31.000000Z"
    },
    {
      "id": 61207,
      "organization_id": 12,
      "published_at": "2024-07-04T05:00:00.000000Z",
      "title":
          "Dishub Kota Banda Aceh Mengikuti Kegiatan Workshop Pengelola Media Sosial Dinas Perhubungan Se-Aceh",
      "link":
          "http://dishub.bandaacehkota.go.id/berita-dishub-kota-banda-aceh-mengikuti-kegiatan-workshop-pengelola-media-sosial-dinas-perhubungan-seaceh.html",
      "organization_name": "Dishub",
      "image": "http://dishub.bandaacehkota.go.id/file/source/022A6166.JPG",
      "created_at": "2024-07-04T05:02:55.000000Z",
      "updated_at": "2024-07-04T07:19:00.000000Z"
    },
    {
      "id": 61208,
      "organization_id": 89,
      "published_at": "2024-07-04T05:36:00.000000Z",
      "title":
          "PEMERINTAH GAMPONG GEUCEU KOMPLEK SALURKAN BLT-DD UNTUK BULAN JULI 2024",
      "link":
          "https://geuceukompleks-gp.bandaacehkota.go.id/2024/07/04/pemerintah-gampong-geuceu-komplek-salurkan-blt-dd-untuk-bulan-juli-2024/",
      "organization_name": "GEUCEU KOMPLEK",
      "image":
          "https://geuceukompleks-gp.bandaacehkota.go.id/wp-content/uploads/sites/58/2024/07/12-678x381.jpg",
      "created_at": "2024-07-04T07:18:09.000000Z",
      "updated_at": "2024-07-04T15:01:57.000000Z"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
              InkWell(
                onTap: () {
                  // Tambahkan aksi yang ingin dilakukan saat gambar diklik
                },
                borderRadius: BorderRadius.circular(50.0),
                child: Ink(
                  width: 52.0,
                  height: 52.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/gambar/filter-news-logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(kategoriBeritas.length, (index) {
                return Row(
                  children: [
                    _kategoriBeritaCard(
                      context,
                      kategoriBeritas[index],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                );
              })),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Column(
            children: List.generate(daftarBerita.length, (index) {
              return Column(
                children: [
                  _beritaBaruCard(
                    context,
                    daftarBerita[index]["image"],
                    daftarBerita[index]["title"],
                    daftarBerita[index]["organization_name"],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _kategoriBeritaCard(context, namaKategori) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(72.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFF1F1F1),
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(72.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        child: Text(
          namaKategori,
          style: TextStyle(
            color: Color(0xFF1A434E),
            fontFamily: "Mulish",
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _beritaBaruCard(
    context,
    String gambarBerita,
    String judul,
    String penulis,
  ) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(15.0),
      child: Ink(
        child: SizedBox(
          width: double.infinity,
          height: 80.0,
          child: Row(
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  color: Color(0xFFBDBDBD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    gambarBerita,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        judul,
                        style: TextStyle(
                          color: Color(0xFF1A434E),
                          fontFamily: "Mulish",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2, // Set the maximum number of lines to 2
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "By",
                          style: TextStyle(
                            color: Color(0xFF95A6AA),
                            fontFamily: "Mulish",
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          penulis,
                          style: TextStyle(
                            color: Color(0xFF1A434E),
                            fontFamily: "Mulish",
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
