import 'package:flutter/foundation.dart';

import 'package:video_thumbnail/video_thumbnail.dart';

Future<Uint8List> getThumbnail(String path) async {
  Uint8List? thumbString = await VideoThumbnail.thumbnailData(
      // thumbnailPath: (await getTemporaryDirectory()).path,
      video: '/$path',
      quality: 50);

  return thumbString!;
}
