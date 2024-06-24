import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:whatsapp_clone/Constants/constants.dart';
import 'package:whatsapp_clone/Screens/Status/videos/video_view_screen.dart';
import 'package:whatsapp_clone/Utils/get_thumbnail.dart';

import '../../../Provider/status_provider.dart';

class VideoStatus extends StatefulWidget {
  const VideoStatus({super.key});

  @override
  State<VideoStatus> createState() => _VideoStatusState();
}

class _VideoStatusState extends State<VideoStatus> {
  bool _isFetched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StatusProvider>(builder: (context, file, child) {
        if (_isFetched == false) {
          file.getStatus(".mp4");
          Future.delayed(Duration(microseconds: 1))
              .then((value) => setState(() {
                    _isFetched = true;
                  }));
        }
        return file.iswhatsappavailabale == false
            ? const Center(
                child: Text("WhatsApp Not Found, Please install it"),
              )
            : file.getvideos.isEmpty
                ? const Center(
                    child: Text("No Videos in your status"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: file.getvideos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemBuilder: (context, index) {
                          final data = file.getvideos[index];
                          // print("the path is ${data.path}");
                          return FutureBuilder<Uint8List>(
                              future: getThumbnail(data.path),
                              builder: (context, snapshot) {
                                // print('the snap is ${snapshot.data}');
                                if (snapshot.hasData &&
                                    snapshot.connectionState ==
                                        ConnectionState.done) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoViewScreen(
                                                    videopath: data.path,
                                                  )));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  MemoryImage(snapshot.data!)),
                                          color: greencolor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Lottie.asset("assets/loading.json"),
                                    //  CircularProgressIndicator(
                                    // color: Colors.green,)
                                  );
                                }

                                if (!snapshot.hasData) {
                                  return Text('No Data');
                                }
                                return Text('page not found');
                              });
                        }));
      }),
    );
  }
}


/* 
GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoViewScreen()));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(''))),
                                  color: greencolor,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          );
                        }),
*/

/*
                return FutureBuilder<String?>(
                              future: getThumbnail(data.path),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState ==
                                        ConnectionState.done) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const VideoViewScreen()));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                  File(snapshot.data!))),
                                          color: greencolor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Lottie.asset("assets/loading.json"),
                                    //  CircularProgressIndicator(
                                    // color: Colors.green,)
                                  );
                                }

                                if (!snapshot.hasData) {
                                  return Text('No Data');
                                }
                                return Text('page not found');
                              });
          
*/