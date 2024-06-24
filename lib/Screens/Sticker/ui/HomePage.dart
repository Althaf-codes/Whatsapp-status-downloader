import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsappstickerapi/whatsappstickerapi.dart';
import '../models/stickerPacks.dart';
import '../models/stickers.dart';
import '../models/model.dart';
import 'dart:async';
import 'dart:convert';
import 'StickerDetails.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url =
      'https://gist.githubusercontent.com/viztushar/e359e5aeadc4fcfece7b48149fb580fe/raw/b58fe6d6d0607a423d9a6ba5fd0a4ec3a0b8f2c4/whatsapp.json';
  // StickerPacks stickerPack = StickerPacks(
  //     avoidcache: false,
  //     identifier: '',
  //     imagedataversion: '',
  //     licenseagreementwebsite: '',
  //     name: '',
  //     privacypolicywebsite: '',
  //     publisher: '',
  //     publisheremail: '.',
  //     publisherwebsite: '',
  //     stickers: [],
  //     trayimagefile: '');

  List<StickerPacks> st = [];
  late bool isLoading, isDownloading = true;
  int iD = -1;
  List<String> downloadList = [];
  List<String> stickerImageList = [];
  @override
  void initState() {
    super.initState();
    isLoading = true;
    isDownloading = true;
    iD = -1;
    this.getJsonData();
  }

  Future getJsonData() async {
    // var response = await http.get(
    //   Uri.encodeFull(url),
    //   headers: {"Accept": "application/json"},
    // );
    setState(() {
      // Map datas = jsonDecode(response.body);
      Map<String, dynamic> datas = {
        "android_play_store_link": "",
        "ios_app_store_link": "",
        "sticker_packs": [
          {
            "identifier": "1",
            "name": "Cuppy",
            "publisher": "Althaf",
            "tray_image_file": "assets/1/tray_Cuppy.png",
            "image_data_version": "1",
            "avoid_cache": false,
            "publisher_email": "",
            "publisher_website": "",
            "privacy_policy_website": "",
            "license_agreement_website": "",
            "animated_sticker_pack": false,
            "stickers": [
              {
                "image_file": "assets/1/01_Cuppy_smile.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/1/02_Cuppy_lol.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/1/03_Cuppy_rofl.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/1/04_Cuppy_sad.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/1/05_Cuppy_cry.webp",
                "emojis": ["😁", "😆"]
              },
              // {
              //   "image_file": "https://raw.githubusercontent.com/hariiprasad/my-personal/master/2.webp",
              //   "emojis": ["??","??"]
              // },
              // {
              //   "image_file": "https://raw.githubusercontent.com/hariiprasad/my-personal/master/3.webp",
              //   "emojis": ["??","??"]
              // },
              // {
              //   "image_file": "https://raw.githubusercontent.com/hariiprasad/my-personal/master/2.webp",
              //   "emojis": ["??","??"]
              // }
            ]
          },
          {
            "identifier": "2",
            "name": "Teststicker new",
            "publisher": "Althaf",
            "tray_image_file": "assets/2/01.png",
            "image_data_version": "1",
            "avoid_cache": false,
            "publisher_email": "",
            "publisher_website": "",
            "privacy_policy_website": "",
            "license_agreement_website": "",
            "animated_sticker_pack": false,
            "stickers": [
              {
                "image_file": "assets/2/01_SendingLove.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/2/02_WellDoThisTogether.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/2/03_Heart.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/2/04_AirHighFive.webp",
                "emojis": ["😁", "😆"]
              },
              {
                "image_file": "assets/2/05_GroupVideoCalling.webp",
                "emojis": ["😁", "😆"]
              },
              // {
              //   "image_file": "https://raw.githubusercontent.com/hariiprasad/my-personal/master/2.webp",
              //   "emojis": ["??","??"]
              // },
              // {
              //   "image_file": "https://raw.githubusercontent.com/hariiprasad/my-personal/master/3.webp",
              //   "emojis": ["??","??"]
              // },
              // {
              //   "image_file": "https://raw.githubusercontent.com/hariiprasad/my-personal/master/2.webp",
              //   "emojis": ["??","??"]
              // }
            ]
          }
        ]
      };
      Model m = Model.formJson(datas);
      for (Map<String, dynamic> json in m.stickerPac) {
        List<Stickers> s = [];
        for (Map<String, dynamic> stickers in json['stickers']) {
          s.add(Stickers(
              imagefile: stickers['image_file'], emojis: stickers['emojis']));
        }
        print(json['publisher_email'] +
            " " +
            json['publisher_website'] +
            " " +
            json['privacy_policy_website'] +
            " " +
            json['license_agreement_website'] +
            " ");
        st.add(StickerPacks(
            identifier: json['identifier'],
            name: json['name'],
            publisher: json['publisher'],
            trayimagefile: json['tray_image_file'],
            publisheremail: json['publisher_email'],
            publisherwebsite: json['publisher_website'],
            privacypolicywebsite: json['privacy_policy_website'],
            licenseagreementwebsite: json['license_agreement_website'],
            stickers: s,
            avoidcache: false,
            imagedataversion: ''));
      }
      isLoading = false;
    });
  }

  navigateToDetailsScreen(id, context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return MyStickerDetails(
        stickerPacks: st[id],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sticker Name"),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: st.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                navigateToDetailsScreen(i, context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        st[i].name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' • ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        st[i].publisher,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    direction: Axis.horizontal,
                                    spacing: 8.0,
                                    runSpacing: 4.0,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Image.asset(
                                            // 'assets/tray_Cuppy.png',
                                            st[i].sticker[0].imagefile,
                                            height: 50.0,
                                            width: 50.0,
                                          ),
                                          Image.asset(
                                            //'assets/tray_Cuppy.png',
                                            st[i].sticker[1].imageFile,
                                            height: 50.0,
                                            width: 50.0,
                                          ),
                                          Image.asset(
                                            // 'assets/tray_Cuppy.png',
                                            st[i].sticker[2].imageFile,
                                            height: 50.0,
                                            width: 50.0,
                                          ),
                                          st[i].sticker.length > 3
                                              ? Image.asset(
                                                  //'assets/tray_Cuppy.png',
                                                  st[i].sticker[3].imageFile,
                                                  height: 50.0,
                                                  width: 50.0,
                                                )
                                              : SizedBox(
                                                  height: 50.0,
                                                  width: 50.0,
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flex(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    if (!downloadList
                                        .contains(st[i].identiFier)) ...[
                                      iD == i && !isDownloading
                                          ? CircularProgressIndicator()
                                          : IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  iD = i;
                                                  isDownloading = false;
                                                  print(isLoading);
                                                  downloadSticker(st[i]);
                                                });
                                              },
                                            ),
                                    ],
                                    if (downloadList
                                        .contains(st[i].identiFier)) ...[
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            iD = i;
                                            print(i);
                                            addToWhatsapp(st[i]);
                                          });
                                        },
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
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

  Future<void> downloadSticker(StickerPacks s) async {
    if (s.publisherEmail == null) s.publisherEmail = "0";
    print((s.publisherEmail == null).toString() +
        s.identiFier +
        " " +
        s.name +
        " " +
        s.publisher +
        " " +
        s.trayImageFile +
        " " +
        s.publisherEmail +
        " " +
        s.publisherWebsite +
        " " +
        s.privacyPolicyWebsite +
        " " +
        s.licenseAgreementWebsite.contains("").toString() +
        " ");

    stickerImageList.clear();
    if (!downloadList.contains(s.identiFier)) {
      await Permission.storage.request();
      Dio dio = Dio();
      var dirToSave = await getApplicationDocumentsDirectory();
      var path = await Directory(dirToSave.path +
              "/" +
              "stickers_asset" +
              "/" +
              s.identiFier +
              "/")
          .create(recursive: true);
      var trypath = await Directory(dirToSave.path +
              "/" +
              "stickers_asset" +
              "/" +
              s.identiFier +
              "/try/")
          .create(recursive: true);
      print(path.path + "\n" + trypath.path);

      String tryFilePath = trypath.path + basename(s.trayImageFile);
      print(tryFilePath);
      await dio.download(s.trayImageFile, tryFilePath,
          onReceiveProgress: (rec, total) {
        print((rec / total) * 100);
        print("try image downloaded");
      });

      for (int i = 0; i < s.sticker.length; i++) {
        String imageFilePath = path.path + basename(s.sticker[i].imageFile);
        stickerImageList.add(basename(s.sticker[i].imageFile));
        await dio.download(s.sticker[i].imageFile, imageFilePath,
            onReceiveProgress: (rec, total) {
          print((rec / total) * 100);
        });
      }

      try {
        WhatsappstickerApi.addToJson(
                identiFier: s.identiFier,
                name: s.name,
                publisher: s.publisher,
                trayimagefile: basename(s.trayImageFile),
                publisheremail: s.publisherEmail,
                publisherwebsite: s.publisherWebsite,
                privacypolicywebsite: s.privacyPolicyWebsite,
                licenseagreementwebsite: s.licenseAgreementWebsite,
                imagedataversion: "1",
                avoidcache: false,
                stickerImages: stickerImageList)
            .then((value) {
          print(value);
        });
        // stickerMethodChannel.invokeMapMethod("addTOJson", {
        //   "identiFier": s.identiFier,
        //   "name": s.name,
        //   "publisher": s.publisher,
        //   "trayimagefile": basename(s.trayImageFile),
        //   "publisheremail": s.publisherEmail,
        //   "publisherwebsite": s.publisherWebsite,
        //   "privacypolicywebsite": s.privacyPolicyWebsite,
        //   "licenseagreementwebsite": s.licenseAgreementWebsite,
        //   "sticker_image": stickerImageList,
        // });
      } on PlatformException catch (e) {
        print(e.details);
      }
      setState(() {
        isDownloading = true;
        if (!downloadList.contains(s.identiFier)) {
          downloadList.add(s.identiFier);
        }
      });
    } else {
      print("not");
    }
  }

  Future<void> showDialogs(context) {
    AlertDialog s = AlertDialog(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Text("Downloading..."),
        ],
      ),
    );
    return showDialog(
      context: context,
      builder: (context) {
        return s;
      },
    );
  }
}