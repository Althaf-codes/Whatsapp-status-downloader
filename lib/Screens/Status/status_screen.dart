import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/Status/Image/image_status_screen.dart';
import 'package:whatsapp_clone/Screens/Status/videos/video_status_screen.dart';
import 'package:whatsapp_clone/constants/constants.dart';

import '../../Utils/sliver_appbar.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: greencolor,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 30),
            child: TabBar(indicatorColor: Colors.black, tabs: [
              Tab(
                icon: Icon(Icons.image_rounded),
                text: 'Images',
              ),
              Tab(
                icon: Icon(Icons.video_library),
                text: 'Videos',
              ),
            ]),
          ),
        ),
        body: const TabBarView(
          children: [ImageStatus(), VideoStatus()],
        ),
      ),
    );
  }
}
