import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappstickerapi/whatsappstickerapi.dart';
import '../models/stickerPacks.dart';

class MyStickerDetails extends StatefulWidget {
  final StickerPacks stickerPacks;
  MyStickerDetails({required this.stickerPacks}) : super();
  @override
  _MyStickerDetailsState createState() => _MyStickerDetailsState();
}

class _MyStickerDetailsState extends State<MyStickerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stickerPacks.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      widget.stickerPacks.trayImageFile,
                      height: 50,
                      width: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 15.0),
                    ),
                    Text(
                      widget.stickerPacks.name,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(50.0, 2.0, 10.0, 0.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        widget.stickerPacks.publisher,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Container(
                child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 8.0 / 9.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: widget.stickerPacks.sticker.length,
                  itemBuilder: (context, i) {
                    return Image.asset(
                      widget.stickerPacks.sticker[i].imageFile,
                      height: 50.0,
                      width: 50.0,
                    );
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: SizedBox.expand(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.all(15.0),
                        ),
                        onPressed: () {
                          print('its here');
                          addToWhatsapp(widget.stickerPacks);
                          print('its over');
                        },
                        child: Text(
                          'Add To WhatsApp',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> addToWhatsapp(StickerPacks s) async {
  try {
    print(s.identiFier);
    print(s.name);
    WhatsappstickerApi.addStickerPackToWhatsApp(
        identifier: s.identiFier, name: s.name);
  } on PlatformException catch (e) {
    print(e.details);
  }
}
