import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebviewPage extends StatefulWidget {
  const MyWebviewPage({super.key});

  @override
  State<MyWebviewPage> createState() => _MyWebviewPageState();
}

class _MyWebviewPageState extends State<MyWebviewPage> {
  String _text = "text:";

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onUrlChange: (change) {
          print(change.url);
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Webview Sample"),
        ),
        body: ColoredBox(
          color: Colors.greenAccent,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Text(
                _text,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text("get scroll"),
                    onPressed: () async {
                      final offset = await controller.getScrollPosition();
                      setState(() {
                        _text = "offset dx: ${offset.dx}, dy${offset.dy} ";
                      });
                    },
                  ),
                  const SizedBox(width: 30),
                  TextButton(
                    child: const Text("get scroll"),
                    onPressed: () async {
                      final offset = await controller.getScrollPosition();
                      setState(() {
                        _text = "offset dx: ${offset.dx}, dy${offset.dy} ";
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // if (_webViewController != null) {
                  //   SendToJs(_webViewController!, _counter).sendData();
                  // }
                },
                child: const Text(
                  'Javascriptにデータを送信',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                // child: InAppWebView(
                //   initialFile: 'assets/www/web.html',
                //   onWebViewCreated: (InAppWebViewController webViewController) {
                //     _webViewController = webViewController;
                //     // Javascriptから呼び出すFlutterの処理を登録
                //     webViewController.addJavaScriptHandler(handlerName: 'sendData', callback: _sendData);
                //   },
                // ),
                child: WebViewWidget(controller: controller),
              ),
            ],
          )),
        ));
  }
}
