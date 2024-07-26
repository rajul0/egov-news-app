import 'package:flutter/material.dart';
import 'dart:async';

class HalamanAwal extends StatefulWidget {
  @override
  _HalamanAwalState createState() => _HalamanAwalState();
}

class _HalamanAwalState extends State<HalamanAwal> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen after 3 seconds
      Navigator.of(context).pushReplacementNamed('/homeNavbar');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Add your splash screen image/logo here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 65.0,
                  child: Image.asset(
                    'assets/gambar/bna-logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Color(0xFF1A434E),
                  height: 65.0,
                  width: 2.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  height: 65.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SINERGI",
                        style: TextStyle(
                          color: Color(0xFF1A434E),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          letterSpacing: 3.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "SISTEM INFORMASI BERITA GAMPONG\nDAN INSTANSI KOTA BANDA ACEH",
                        style: TextStyle(
                            color: Color(0xFF1A434E),
                            fontWeight: FontWeight.bold,
                            fontSize: 8.0,
                            wordSpacing: 5.0),
                        maxLines: 2,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Color(0xFFBDBDBD),
            ),
          ],
        ),
      ),
    );
  }
}
