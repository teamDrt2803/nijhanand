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
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff979797).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TextField(
                      onTap: () {
                        showSearch(context: context, delegate: SearchWidget());
                      },
                      autofocus: false,
                      decoration: const InputDecoration.collapsed(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(fontSize: 22, color: Colors.black)),
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: ValueListenableBuilder(
                  valueListenable: Boxes().bhajanBox.listenable(),
                  builder: (context, Box<Bhajan> bhajans, _) {
                    var results = query == null
                        ? bhajans.values.toList()
                        : bhajans.values
                            .where((bhajan) => bhajan.lyrics.contains(query!))
                            .toList;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.separated(
                          itemCount: bhajans.values.length,
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 8,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            final _bhajanModal = bhajans.getAt(index);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    Get.toNamed(Routes.lyrics, arguments: {
                                      "bhajan": _bhajanModal,
                                    });
                                  }),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text(
                                        _bhajanModal!.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Noto Serif Gujarati',
                                          fontSize: 20,
                                          color: Color(0xffFF7643),
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
                            );
                          }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
