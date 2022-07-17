import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nijhanand/controller/bhajan_controller.dart';
import 'package:nijhanand/utils/constants.dart';
import 'package:nijhanand/widgets/search.dart';

import '../helper/routes.dart';
import '../modals/bhajan_modal.dart';

class Bhajanvali extends StatefulWidget {
  const Bhajanvali({Key? key}) : super(key: key);

  @override
  State<Bhajanvali> createState() => _BhajanvaliState();
}

class _BhajanvaliState extends State<Bhajanvali> {
  final bhajanController = BhajanController.instance;
  final bool _isFavorite = false;
  String? query;

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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'ૐ નામો નારાયણ',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          'જય ગિરનારી',
                          style: TextStyle(fontFamily: 'Rasa',fontSize: 64, color: Colors.white),
                        ),
                      ],
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
                          children: [
                            const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: TextField(
                              onTap: () {
                                showSearch(
                                    context: context, delegate: SearchWidget());
                              },
                              cursorColor: Colors.white,
                              autofocus: false,
                              decoration: const InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      fontSize: 22, color: Colors.white)),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    color: Colors.white,
                    child: ValueListenableBuilder(
                      valueListenable: Boxes().bhajanBox.listenable(),
                      builder: (context, Box<Bhajan> bhajans, _) {
                        var results = query == null
                            ? bhajans.values.toList()
                            : bhajans.values
                                .where(
                                    (bhajan) => bhajan.lyrics.contains(query!))
                                .toList;
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: ListView.builder(
                              itemCount: bhajans.values.length,
                              itemBuilder: (BuildContext context, int index) {
                                final _bhajanModal = bhajans.getAt(index);
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            offset: const Offset(1, 1),
                                            blurRadius: 6.0,
                                            spreadRadius: 1,
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (() {
                                            Get.toNamed(Routes.lyrics,
                                                arguments: {
                                                  "bhajan": _bhajanModal,
                                                });
                                          }),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.75,
                                              child: Text(
                                                _bhajanModal!.title,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'Noto Serif Gujarati',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: (() {}),
                                            icon: Icon(
                                              Icons.favorite_border_rounded,
                                              color: _isFavorite
                                                  ? Colors.red
                                                  : Colors.black,
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
