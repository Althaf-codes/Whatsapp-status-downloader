import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_clone/Screens/Sticker/sticker_list.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class StickerScreen extends StatefulWidget {
  const StickerScreen({super.key});

  @override
  State<StickerScreen> createState() => _StickerScreenState();
}

class _StickerScreenState extends State<StickerScreen> {
  @override
  Widget build(BuildContext context) {
    launchWhatsApp() async {
      final link = WhatsAppUnilink(
        phoneNumber: '+919629700326',
        text: "Hey testing 1",
      );

      await launchUrl(Uri.parse('$link'),
          webViewConfiguration: WebViewConfiguration(enableDomStorage: true));
    }

    // List<Widget> fakeBottomButtons = [];
    // fakeBottomButtons.add(
    //   Container(
    //     height: 50.0,
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trendy WhatsApp Stickers"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('check'),
              onPressed: () {
                launchWhatsApp().then((value) {});
              },
            ),
          )
        ],
      ),
    );
  }
}
