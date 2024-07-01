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
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your splash screen image/logo here
            Image.asset('assets/gambar/pic-logo.png'),
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
