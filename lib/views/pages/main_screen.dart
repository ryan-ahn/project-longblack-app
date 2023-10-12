import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}):super(key:key);

  @override
  State<MainScreen> createState() => WebViewPageState();
}

class WebViewPageState extends State<MainScreen> {
  final GlobalKey webViewKey = GlobalKey();
  Uri myUrl = Uri.parse("https://www.longblack.co/");
  late final InAppWebViewController webViewController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WillPopScope(
                onWillPop: () async => false,
                child: Column(children: <Widget>[
                  progress < 1.0
                      ? LinearProgressIndicator(value: progress, color: Colors.blue)
                      : Container(),
                  Expanded(
                      child: Stack(children: [
                        InAppWebView(
                          key: webViewKey,
                          initialUrlRequest: URLRequest(url: myUrl),
                          initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                                javaScriptCanOpenWindowsAutomatically: true,
                                javaScriptEnabled: true,
                                useOnDownloadStart: true,
                                useOnLoadResource: true,
                                useShouldOverrideUrlLoading: true,
                                mediaPlaybackRequiresUserGesture: true,
                                allowFileAccessFromFileURLs: true,
                                allowUniversalAccessFromFileURLs: true,
                                verticalScrollBarEnabled: true,
                                userAgent: 'Mozilla/5.0 (Linux; Android 9; LG-H870 Build/PKQ1.190522.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36'
                            ),
                            android: AndroidInAppWebViewOptions(
                                useHybridComposition: true,
                                allowContentAccess: true,
                                builtInZoomControls: true,
                                thirdPartyCookiesEnabled: true,
                                allowFileAccess: true,
                                supportMultipleWindows: true
                            ),
                            ios: IOSInAppWebViewOptions(
                              allowsInlineMediaPlayback: true,
                              allowsBackForwardNavigationGestures: true,
                            ),
                          ),
                          onLoadStop: (InAppWebViewController controller, uri) {
                            setState(() {myUrl = uri!;});
                          },
                          onCreateWindow: (controller, createWindowRequest) async{
                            showDialog(
                              context: context, builder: (context) {
                              return AlertDialog(
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 400,
                                  child: InAppWebView(
                                    // Setting the windowId property is important here!
                                    windowId: createWindowRequest.windowId,
                                    initialOptions: InAppWebViewGroupOptions(
                                      android: AndroidInAppWebViewOptions(
                                        builtInZoomControls: true,
                                        thirdPartyCookiesEnabled: true,
                                      ),
                                      crossPlatform: InAppWebViewOptions(
                                        mediaPlaybackRequiresUserGesture: false,
                                        cacheEnabled: true,
                                        javaScriptEnabled: true,
                                        userAgent: "Mozilla/5.0 (Linux; Android 9; LG-H870 Build/PKQ1.190522.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36",
                                      ),
                                      ios: IOSInAppWebViewOptions(
                                        allowsInlineMediaPlayback: true,
                                        allowsBackForwardNavigationGestures: true,
                                      ),
                                    ),
                                    onCloseWindow: (controller) async{
                                      if (Navigator.canPop(context)) {
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                ),);
                            },
                            );
                            return true;
                          },
                        )
                      ]))
                ])
            )
        )
    );
  }
}