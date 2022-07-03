import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nijhanand/helper/routes.dart';
import 'package:nijhanand/utils/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final myMenuItems={'Upload','Bhajanavali'};
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'નિજાનંદ',
              style: TextStyle(fontSize: 30),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: primaryColor,
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return myMenuItems.map((item) {
                    return PopupMenuItem(
                      child: Text(item),
                      value: item,
                    );
                  }).toList();
                },
                onSelected: (page) {
                  switch (page) {
                    case 'Upload':
                      Get.toNamed(Routes.upload);
                      break;
                     case 'Bhajanavali':
                      Get.toNamed(Routes.bhajanavali);
                      break;
                  }
                },
              )
            ],
          ),
    );
  }
}