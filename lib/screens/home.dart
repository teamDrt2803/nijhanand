import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nijhanand/helper/routes.dart';
import 'package:nijhanand/screens/bhajanavali.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final dataList = [
    {'icon': Icons.home, 'route': Routes.home},
    {'icon': Icons.upload_rounded, 'route': Routes.upload},
    {'icon': Icons.favorite_outline_rounded, 'route': ''}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.home);
                },
                icon: const Icon(
                  Icons.home,
                  size: 32,
                )),
            IconButton(
                onPressed: () {
                     Get.toNamed(Routes.upload);
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
      body: const Bhajanvali(),
    );
  }
}
