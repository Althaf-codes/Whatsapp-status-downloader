import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:whatsapp_clone/Utils/gradient_button.dart';
import 'package:whatsapp_clone/Utils/show_snackbar.dart';
import 'package:whatsapp_clone/constants/constants.dart';

class ImageViewScreen extends StatelessWidget {
  String imgpath;
  ImageViewScreen({super.key, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: greencolor,
        ),
        // floatingActionButton: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 20.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: List.generate(
        //           2,
        //           (index) => FloatingActionButton(
        //               heroTag: index,
        //               backgroundColor: Colors.green,
        //               child: icons[index],
        //               onPressed: () {
        //                 switch (index) {
        //                   case 0:
        //                     ImageGallerySaver.saveFile(imgpath).then((value) =>
        //                         showSnackbar(
        //                             context, 'Image Saved Successfully'));
        //                     break;

        //                   case 1:
        //                     Share.shareFiles([imgpath]);
        //                     print("case 3");

        //                     break;
        //                 }
        //               })),
        //     ),
        //   ),
        // ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: FileImage(File(imgpath)))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gradientbutton(
                      onpressed: () {
                        ImageGallerySaver.saveFile(imgpath).then((value) =>
                            showSnackbar(context, 'Image Saved Successfully'));
                      },
                      icon: Icons.download,
                      label: 'Download'),
                  gradientbutton(
                      onpressed: () {
                        Share.shareFiles([imgpath]);
                      },
                      icon: Icons.share,
                      label: 'Share')
                ],
              ),
            ),
          )
        ]));
  }
}


// List<Icon> icons = [
    //   const Icon(Icons.download),
    //   const Icon(Icons.share),
    // ];