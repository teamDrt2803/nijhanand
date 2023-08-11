import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nijhanand/screens/bhajanavali.dart';
import 'package:nijhanand/screens/info.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;
  final pages = [const Bhajanvali(), const Infoscreen()];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        body: SafeArea(
          child: pages.elementAt(pageIndex),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
            width: 2,
            color: Color(0xffF1EEE9),
          ))),
          child: BottomNavigationBar(
              elevation: 10,
              selectedItemColor: const Color(0xffF38E61),
              unselectedItemColor: const Color(0xff787881),
              currentIndex: pageIndex,
              onTap: (int index) {
                setState(() {
                  pageIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Search',
                  activeIcon: Icon(
                    Icons.search,
                    color: Color(0xffF38E61),
                  ),
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: 'Info',
                  activeIcon: Icon(
                    Icons.info,
                    color: Color(0xffF38E61),
                  ),
                  icon: Icon(Icons.info),
                )
              ]),
        ),
      ),
    );
  }
}
