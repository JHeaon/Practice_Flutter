import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: WillPopScope(
        onWillPop: () async{
          if (await controller.canGoBack()){
            await controller.goBack();
            return false;
          }
          return true;
        },
          child: WebViewWidget(controller: controller)
      ),
    );
  }
}

WebViewController controller = WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..setBackgroundColor(const Color(0x00000000))
..setNavigationDelegate(
NavigationDelegate(
onProgress: (int progress) {
// Update loading bar.
},
onPageStarted: (String url) {},
onPageFinished: (String url) {},
onWebResourceError: (WebResourceError error) {},
onNavigationRequest: (NavigationRequest request) {
if (request.url.startsWith('https://www.youtube.com/')) {
return NavigationDecision.prevent;
}
return NavigationDecision.navigate;
},
),
)
..loadRequest(Uri.parse('https://www.youtube.com'));