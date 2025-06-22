import 'package:animations/animations.dart';
import 'package:sinergi/halaman/component/berita_baru_card.dart';
import 'package:sinergi/halaman/halaman_detail_berita/halaman_detail_berita.dart';
import 'package:sinergi/halaman/halaman_webview/halaman_webview_detail_berita.dart';
import 'package:sinergi/proses/get_data.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HalamanBeritaSelengkapnya extends StatefulWidget {
  final jenisBerita;

  const HalamanBeritaSelengkapnya({
    Key? key,
    required this.jenisBerita,
  });

  @override
  _HalamanBeritaSelengkapnyaState createState() =>
      _HalamanBeritaSelengkapnyaState();
}

class _HalamanBeritaSelengkapnyaState extends State<HalamanBeritaSelengkapnya> {
  Key _key = UniqueKey();
  int pagekey = 0;
  static const _pageSize = 6;
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
      List data = [];

      if (widget.jenisBerita == "SINERGI") {
        data = await ambilBerita(_pageSize, pageKey: pageKey);
      } else if (widget.jenisBerita == "INONG") {
        data = await ambilBeritaInong(_pageSize, pageKey: pageKey);
      } else if (widget.jenisBerita == "AGAM") {
        data = await ambilBeritaAgam(_pageSize, pageKey: pageKey);
      }

      final newFeeds = data.map((json) => Feed.fromJson(json)).toList();

      final isLastPage = newFeeds.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newFeeds);
      } else {
        final nextPageKey = pageKey + 1;
        pagekey = nextPageKey;
        _pagingController.appendPage(newFeeds, nextPageKey);
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
                          widget.jenisBerita == "SINERGI"
                              ? "SINERGI"
                              : widget.jenisBerita == "INONG"
                                  ? "Informasi Gampong (INONG)"
                                  : "Agregator Gampong (AGAM)",
                          style: TextStyle(
                              color: Color(0xFF1A434E),
                              fontFamily: "Mulish",
                              fontSize:
                                  widget.jenisBerita == "SINERGI" ? 24.0 : 20.0,
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
                    itemBuilder: (context, item, index) => OpenContainer(
                      closedElevation: 0.0,
                      openElevation: 0.0,
                      transitionType: ContainerTransitionType.fadeThrough,
                      transitionDuration: Duration(milliseconds: 500),
                      closedBuilder:
                          (BuildContext context, VoidCallback openContainer) {
                        return Column(
                          children: [
                            beritaBaruCard(
                              context,
                              item.image,
                              item.title,
                              item.organization_name,
                              openContainer,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                          ],
                        );
                      },
                      openBuilder: (context, action) {
                        if (item.url.contains("iemasenuleekareng.gampong.id") ||
                            item.url
                                .contains("lhongcut-gp.bandaacehkota.go.id")) {
                          return HalamanWebViewDetailBerita(url: item.url);
                        } else {
                          return HalamanDetailBerita(
                            gambarBerita: item.image,
                            judulBerita: item.title,
                            url: item.url,
                            penulis: item.organization_name,
                          );
                        }
                      },
                    ),
                    newPageProgressIndicatorBuilder: (context) => Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(
                            0xFF1A434E)), // Ganti dengan warna yang diinginkan
                      ),
                    ),
                    firstPageProgressIndicatorBuilder: (context) => Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(
                            0xFF1A434E)), // Ganti dengan warna yang diinginkan
                      ),
                    ),
                    firstPageErrorIndicatorBuilder: (context) => Center(
                        child: Text('Something went wrong. Please try again.')),
                    noItemsFoundIndicatorBuilder: (context) =>
                        Center(child: Text('No items found')),
                  ),
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
  final String url;

  Feed({
    required this.title,
    required this.image,
    required this.organization_name,
    required this.url,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      title: json['title'],
      image: json['image'],
      organization_name: json['organization_name'],
      url: json['link'],
    );
  }
}
