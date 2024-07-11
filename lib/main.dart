import 'package:egov_news_app/halaman/beranda_navbar.dart';
import 'package:egov_news_app/halaman/halaman_awal.dart';
import 'package:egov_news_app/halaman/beranda/halaman_beranda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Mulish'),
      home: HalamanAwal(),
      routes: {
        '/home': (context) => HalamanBeranda(),
        '/homeNavbar': (context) => BerandaNavbar(),
      },
    );
  }
}
