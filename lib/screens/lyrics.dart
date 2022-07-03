import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:nijhanand/utils/constants.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bhajan = Get.arguments["bhajan"] as Bhajan;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          bhajan.title,
          style: const TextStyle(fontSize: 30),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24.0),
        child: SingleChildScrollView(
          child: Text(
            bhajan.lyrics,
            style: const TextStyle(fontFamily: 'Rasa',fontSize: 22.0),textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
