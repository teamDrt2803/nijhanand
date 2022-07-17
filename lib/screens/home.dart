import 'package:flutter/material.dart';
import 'package:nijhanand/screens/bhajanavali.dart';
import 'package:nijhanand/screens/upload.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    int pageIndex = 0;
  final pages=[const Bhajanvali(),const Uploadpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                 setState(() {
                pageIndex = 0;
              });
                },
                icon: const Icon(
                  Icons.home,
                  size: 32,
                )),
            IconButton(
                onPressed: () {
                    setState(() {
                pageIndex = 1;
              });
                },
                icon: const Icon(
                  Icons.upload_rounded,
                  size: 32,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_rounded,
                  size: 32,
                )),
          ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
