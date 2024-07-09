import 'package:egov_news_app/halaman/beranda/halaman_beranda.dart';
import 'package:egov_news_app/halaman/dummy_page.dart';
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
    DummyPage(),
    DummyPage(),
    DummyPage(),
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
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: '',
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
            label: '',
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
            label: '',
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
            label: '',
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
