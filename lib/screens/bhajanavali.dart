import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nijhanand/controller/bhajan_controller.dart';
import 'package:nijhanand/helper/routes.dart';
import 'package:nijhanand/utils/constants.dart';

class Bhajanvali extends StatefulWidget {
  const Bhajanvali({Key? key}) : super(key: key);

  @override
  State<Bhajanvali> createState() => _BhajanvaliState();
}

class _BhajanvaliState extends State<Bhajanvali> {
 
  final bhajanController = BhajanController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: primaryColor),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ભજનાવલી ',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(8.0)),
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: TextField(
                                  cursorColor: Colors.white,
                                  autofocus: false,
                                  decoration: InputDecoration.collapsed(
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                          fontSize: 22, color: Colors.white)),
                                ))
                              ],
                            ),
                          ),
                        )
                      ])),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: MediaQuery.of(context).size.height * 0.18),
                  child: ListView.builder(
                      itemCount: bhajanController.bhajanList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final _bhajanModal = bhajanController.bhajanList[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: (() {
                                    Get.toNamed(Routes.lyrics, arguments: {
                                      "bhajan": _bhajanModal,
                                    });
                                  }),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.75,
                                        child: Text(
                                          _bhajanModal.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: 'Noto Serif Gujarati',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,),
                                        ),
                                      ),
                                   
                                      IconButton(
                                          onPressed: (() {}),
                                          icon: const Icon(
                                              Icons.favorite_border_rounded))
                                    ],
                                  )),
                            ),
                            const Divider(
                              height: 8.0,
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
