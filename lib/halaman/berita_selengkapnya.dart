import 'package:egov_news_app/halaman/component/berita_baru_card.dart';
import 'package:egov_news_app/halaman/halaman_detail_berita/halaman_detail_berita.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HalamanBeritaSelengkapnya extends StatefulWidget {
  @override
  _HalamanBeritaSelengkapnyaState createState() =>
      _HalamanBeritaSelengkapnyaState();
}

class _HalamanBeritaSelengkapnyaState extends State<HalamanBeritaSelengkapnya> {
  Key _key = UniqueKey();
  static const _pageSize = 5;
  final PagingController<int, Feed> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchFeeds(pageKey);
    });
  }

  Future<void> _refresh() async {
    setState(() {
      _key = UniqueKey();
    });
  }

  Future<void> _fetchFeeds(int pageKey) async {
    try {
      final response = await http.get(Uri.parse(
          'https://sinergi.bandaacehkota.go.id/api/feeds?limit=$_pageSize&page=$pageKey'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)["data"] as List;
        final newFeeds = data.map((json) => Feed.fromJson(json)).toList();

        final isLastPage = newFeeds.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newFeeds);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newFeeds, nextPageKey);
        }
      } else {
        _pagingController.error = 'Error loading page';
      }
    } catch (e) {
      _pagingController.error = 'Error loading page';
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_sharp)),
                    Column(
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
                          "SINERGI",
                          style: TextStyle(
                              color: Color(0xFF1A434E),
                              fontFamily: "Mulish",
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PagedListView<int, Feed>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Feed>(
                      itemBuilder: (context, item, index) => Column(
                            children: [
                              beritaBaruCard(context, item.image, item.title,
                                  item.organization_name, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HalamanDetailBerita(
                                      gambarBerita: item.image,
                                      judulBerita: item.title,
                                      berita: "Ini isi berita",
                                      penulis: item.organization_name,
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(
                                height: 25.0,
                              ),
                            ],
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Feed {
  final String title;
  final String image;
  final String organization_name;

  Feed({
    required this.title,
    required this.image,
    required this.organization_name,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      title: json['title'],
      image: json['image'],
      organization_name: json['organization_name'],
    );
  }
}
