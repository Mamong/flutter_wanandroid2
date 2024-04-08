import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewScreen> {
  late WebViewController controller;
  final loadingNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print("progress:$progress");
          },
          onPageStarted: (String url) {
            loadingNotifier.value = true;
          },
          onPageFinished: (String url) {
            loadingNotifier.value = false;
          },
          onWebResourceError: (WebResourceError error) {
            loadingNotifier.value = false;
            print(error.description);
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
        ValueListenableBuilder(
            valueListenable: loadingNotifier,
            builder: (_, value, __) => Visibility(
                visible: value,
                child: const CupertinoActivityIndicator(
                  color: Colors.white,
                  animating: true,
                ))),
        Expanded(
            child: Text(
          widget.title,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ))
      ])),
      body: WebViewWidget(controller: controller),
    );
  }
}
