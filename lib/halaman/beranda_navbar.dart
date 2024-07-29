import 'package:SINERGI/halaman/halaman_agam/halaman_agam.dart';
import 'package:SINERGI/halaman/halaman_beranda/halaman_beranda.dart';
import 'package:SINERGI/halaman/halaman_inong/halaman_inong.dart';
import 'package:SINERGI/halaman/halaman_statistik/halaman_statistik.dart';
import 'package:flutter/material.dart';

class BerandaNavbar extends StatefulWidget {
  @override
  _BerandaNavbarState createState() => _BerandaNavbarState();
}

class _BerandaNavbarState extends State<BerandaNavbar> {
  int _selectedIndex = 0;

  final List<String> _pngIcon = [
    'assets/gambar/unselected-home-logo.png',
    'assets/gambar/unselected-inong-logo.png',
    'assets/gambar/unselected-agam-logo.png',
    'assets/gambar/unselected-statistic-logo.png',
  ];

  final List<Widget> _widgetOptions = [
    HalamanBeranda(),
    HalamanInong(),
    HalamanAgam(),
    HalamanStatistik(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF1A434E),
        unselectedItemColor: Color(0xFF95A6AA),
        selectedFontSize: 12.0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image(
                image: _selectedIndex ==
                        _pngIcon
                            .indexOf('assets/gambar/unselected-home-logo.png')
                    ? AssetImage(
                        'assets/gambar/selected-home-logo.png',
                      )
                    : AssetImage(
                        'assets/gambar/unselected-home-logo.png',
                      ),
                width: 30.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'INONG',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image(
                image: _selectedIndex ==
                        _pngIcon
                            .indexOf('assets/gambar/unselected-inong-logo.png')
                    ? AssetImage(
                        'assets/gambar/selected-inong-logo.png',
                      )
                    : AssetImage(
                        'assets/gambar/unselected-inong-logo.png',
                      ),
                width: 30.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'AGAM',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image(
                image: _selectedIndex ==
                        _pngIcon
                            .indexOf('assets/gambar/unselected-agam-logo.png')
                    ? AssetImage(
                        'assets/gambar/selected-agam-logo.png',
                      )
                    : AssetImage(
                        'assets/gambar/unselected-agam-logo.png',
                      ),
                width: 30.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Statistik',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image(
                image: _selectedIndex ==
                        _pngIcon.indexOf(
                            'assets/gambar/unselected-statistic-logo.png')
                    ? AssetImage(
                        'assets/gambar/selected-statistic-logo.png',
                      )
                    : AssetImage(
                        'assets/gambar/unselected-statistic-logo.png',
                      ),
                width: 30.0,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
