import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Provider/status_provider.dart';
import 'package:whatsapp_clone/Screens/Status/Image/image_view_screen.dart';
import 'package:whatsapp_clone/constants/constants.dart';

class ImageStatus extends StatefulWidget {
  const ImageStatus({super.key});

  @override
  State<ImageStatus> createState() => _ImageStatusState();
}

class _ImageStatusState extends State<ImageStatus> {
  bool _isFetched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StatusProvider>(builder: (context, file, child) {
        if (_isFetched == false) {
          file.getStatus(".jpg");
          Future.delayed(Duration(microseconds: 1))
              .then((value) => setState(() {
                    _isFetched = true;
                  }));
        }
        return file.iswhatsappavailabale == false
            ? const Center(
                child: Text("WhatsApp Not Found, Please install it"),
              )
            : file.getimages.isEmpty
                ? const Center(
                    child: Text("No Images in your status"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: file.getimages.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemBuilder: (context, index) {
                          final data = file.getimages[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImageViewScreen(
                                            imgpath: data.path,
                                          )));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(data.path))),
                                  color: greencolor,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          );
                        }),
                  );
      }),
    );
  }
}
