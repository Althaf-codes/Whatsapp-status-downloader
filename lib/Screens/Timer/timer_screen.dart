import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/constants.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Status screen',
        style: TextStyle(color: greencolor),
      ),
    );
  }
}
