import 'package:egov_news_app/halaman/beranda/component/spotlight_component.dart';
import 'package:flutter/material.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 50.0,
            right: 24.0,
            bottom: 32.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Pagi",
                        style: TextStyle(
                            color: Color(0xFF95A6AA),
                            fontFamily: "Mulish",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Sirajul Ilmi",
                        style: TextStyle(
                            color: Color(0xFF1A434E),
                            fontFamily: "Mulish",
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/gambar/notif-logo.png",
                    width: 50.0,
                  )
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              SpotlightComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
