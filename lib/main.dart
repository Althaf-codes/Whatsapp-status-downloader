import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Provider/status_provider.dart';
import 'package:whatsapp_clone/constants/constants.dart';
import 'package:whatsapp_clone/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => StatusProvider())],
      child: MaterialApp(
          title: 'Flutter Demo', themeMode: ThemeMode.dark, home: HomePage()),
    );
  }
}
