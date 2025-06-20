import 'package:SINERGI/halaman/beranda_navbar.dart';
import 'package:SINERGI/halaman/halaman_awal.dart';
import 'package:SINERGI/halaman/halaman_beranda/halaman_beranda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
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
