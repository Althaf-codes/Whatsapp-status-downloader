import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Constants/constants.dart';
import 'package:whatsapp_clone/Screens/Status/status_screen.dart';
import 'package:whatsapp_clone/Screens/Sticker/sticker_screen.dart';
import 'package:whatsapp_clone/Screens/Timer/timer_screen.dart';

import '../Utils/scroll_tohide_widget.dart';
import 'Sticker/ui/HomePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool isFab = false;
  bool isBottom = true;
  ScrollController bottomScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    //  final Object? user = ModalRoute.of(context)!.settings.arguments;

    // final phnNum = widget.args.phnNum;
    // final name = widget.args.userName;
    // print("the phnNum in mainhomepage ${phnNum}");
    // print("the userName in mainhomePage  ${name}");
    List<Widget> screens = [
      const StatusScreen(),
      const TimerScreen(),
    ];
    // bool isPost = false;
    // bool true;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isFab ? MyHomePage() /*StickerScreen()*/ : screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isFab
          ? FloatingActionButton.extended(
              heroTag: 'MainFAB',
              onPressed: () {
                if (isFab == true) return;
                if (isFab == false) {
                  setState(() {
                    isFab = true;
                  });
                }
              },
              tooltip: 'Sticker',
              icon: const Icon(
                Icons.emoji_emotions,
                color: Colors.white,
              ),
              label: const Text(
                "Sticker",
              ),
              backgroundColor: greencolor)
          : FloatingActionButton(
              heroTag: 'MainFAB',
              onPressed: () {
                if (isFab == true) return;
                if (isFab == false) {
                  setState(() {
                    isFab = true;
                  });
                }
              },
              backgroundColor: isFab ? greencolor : Colors.white,
              tooltip: 'Sticker',
              child: Icon(
                Icons.add,
                color: isFab ? Colors.white : greencolor,
              ),
            ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFab = false;
                      _currentIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.download,
                          color: _currentIndex == 0 && !isFab
                              ? greencolor
                              : greencolor,
                          size: _currentIndex == 0 && !isFab ? 28 : 24,
                        ),
                        Text(
                          _currentIndex == 0 && !isFab ? 'Status' : '',
                          style: TextStyle(
                              color: _currentIndex == 0 && !isFab
                                  ? greencolor
                                  : greencolor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFab = false;
                      _currentIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer,
                          color: _currentIndex == 1 && !isFab
                              ? greencolor
                              : greencolor,
                          size: _currentIndex == 1 && !isFab ? 28 : 24,
                        ),
                        Text(
                          _currentIndex == 1 && !isFab ? 'Timer' : '',
                          style: TextStyle(
                              color: _currentIndex == 1 && !isFab
                                  ? greencolor
                                  : greencolor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )),
    );
  }
}

/*
 late bool isMainscreen;
  @override
  void initState() {
    super.initState();
    isMainscreen = true;
  }

  List<Widget> _screen = [
    //   StatusScreen(),
    TimerScreen(),
    StickerScreen()
  ];
  int current_index = 0;

  void onIndexChanged(index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status_downloader',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: navbarColour,
        //  leading: Expanded(child: Text('Status_downloader',style: TextStyle(fontWeight: FontWeight.w600,),)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: isMainscreen ? StatusScreen() : _screen[current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (index) {
          onIndexChanged(index);
          setState(() {
            isMainscreen = false;
          });
        },
        selectedItemColor: isMainscreen ? inactiveiconColour : Colors.green,
        unselectedItemColor: inactiveiconColour,
        backgroundColor: navbarColour,
        selectedFontSize: 13,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.palette_sharp), label: 'Stickers'),
          //   BottomNavigationBarItem(icon: Icon(Ic))
        ],
      ),
      floatingActionButton: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: navbarColour),
              color: Colors.green),
          child: IconButton(
              onPressed: () {
                setState(() {
                  isMainscreen = true;
                });
              },
              icon: Icon(
                Icons.download_sharp,
                color: isMainscreen ? navbarColour : inactiveiconColour,
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
*/
