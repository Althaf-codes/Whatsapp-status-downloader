// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';

// Future<void> processResponse(
//     {required StickerPackResult action,
//     required bool result,
//     required String? error,
//     required BuildContext context,
//     required Function successCallback}) async {
//   print("_listener");
//   print(action);
//   print(result);
//   print(error);

//   late SnackBar snackBar;

//   switch (action) {
//     case StickerPackResult.SUCCESS:
//     case StickerPackResult.ADD_SUCCESSFUL:
//     case StickerPackResult.ALREADY_ADDED:
//       successCallback;
//       break;
//     case StickerPackResult.CANCELLED:
//       snackBar = SnackBar(content: Text('Cancelled Sticker Pack Install'));
//       break;
//     case StickerPackResult.ERROR:
//       snackBar = SnackBar(content: Text(error ?? 'receiving null value'));
//       break;
//     case StickerPackResult.UNKNOWN:
//       snackBar = SnackBar(content: Text('Unkown Error - check the logs'));
//       break;
//   }

//   /// Display a snack bar
//   if (snackBar != null && context != null) {
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
