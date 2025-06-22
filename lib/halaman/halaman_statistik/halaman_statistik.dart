import 'package:sinergi/halaman/component/halaman_webview_custom.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HalamanStatistik extends StatefulWidget {
  const HalamanStatistik({super.key});

  @override
  State<HalamanStatistik> createState() => _HalamanStatistikState();
}

class _HalamanStatistikState extends State<HalamanStatistik> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
          Uri.parse('https://sinergi.bandaacehkota.go.id/statistics'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    if (await controller.canGoBack()) {
                      await controller.goBack();
                    } else {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text("No Back History Found"),
                        ),
                      );
                      return;
                    }
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    if (await controller.canGoForward()) {
                      await controller.goForward();
                    } else {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text("No Forward History Found"),
                        ),
                      );
                      return;
                    }
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
                IconButton(
                  onPressed: () {
                    controller.reload();
                  },
                  icon: Icon(Icons.replay),
                ),
              ],
            ),
          )),
      body: CustomWebView(
        controller: controller,
      ),
    );
  }
}
