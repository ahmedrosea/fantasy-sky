import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app_colors.dart';

class VRWebViewScreen extends StatelessWidget {
  VRWebViewScreen({Key? key, required this.url, required this.title})
      : super(key: key);
  final String url;
  final String title;

  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this._controller = controller;
              },
              onPageFinished: (finish) {
                _controller.runJavascript(
                    "document.getElementsByClassName('js-back-button')[0].style.display = 'none'");
                _controller.runJavascript(
                    "document.getElementsByClassName('panorama-title')[0].style.display = 'none'");
                _controller.runJavascript(
                    "document.getElementsByClassName('space-author-region-inner')[0].style.display = 'none'");
                _controller.runJavascript(
                    "document.getElementsByClassName('tour-toggle-map')[0].style.display = 'none'");
                _controller.runJavascript(
                    "document.getElementsByClassName('js-comments')[0].style.display = 'none'");
                _controller.runJavascript(
                    "document.getElementsByClassName('panorama-header-control-like')[0].style.display = 'none'");
                _controller.runJavascript(
                    "document.getElementsByClassName('js-multifunction')[0].style.display = 'none'");
              },
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 26.0,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
var s2 = document.getElementsByClassName('panorama-title');
s2[0].style.display = 'none';;

*/