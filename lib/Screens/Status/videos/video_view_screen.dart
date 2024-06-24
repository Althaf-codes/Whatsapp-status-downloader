import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../Constants/constants.dart';
import '../../../Utils/gradient_button.dart';
import '../../../Utils/show_snackbar.dart';

class VideoViewScreen extends StatefulWidget {
  String videopath;
  VideoViewScreen({super.key, required this.videopath});

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  ChewieController? _chewieController;
  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.file(File('/${widget.videopath}')),
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      aspectRatio: 5 / 6,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _chewieController!.pause();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: greencolor,
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Chewie(
                controller: _chewieController!,
              ),
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
                        ImageGallerySaver.saveFile(widget.videopath).then(
                            (value) => showSnackbar(
                                context, 'Video Saved Successfully'));
                      },
                      icon: Icons.download,
                      label: 'Download'),
                  gradientbutton(
                      onpressed: () {
                        Share.shareFiles([widget.videopath]);
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
