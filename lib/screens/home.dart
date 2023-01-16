import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nijhanand/helper/routes.dart';
import 'package:nijhanand/screens/bhajanavali.dart';
import 'package:nijhanand/screens/upload.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;
  final pages = [const Bhajanvali(), const Uploadpage()];

  final List data = [
    {
      'label': 'ભજનાવલી',
      'route': Routes.bhajanavali,
      'asset': 'assets/icons/book-open.svg',
    },
    {
      'label': 'અમારા વિશે',
      'route': Routes.upload,
      'asset': 'assets/icons/about.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    '|| જય ગિરનારી ||',
                    style: TextStyle(
                      color: Color(0xffFF7643),
                    ),
                  ),
                  Container(
                    height: 195,
                    width: 270,
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/santvani_na_mahasagar.png'),
                      ),
                    ),
                  ),
                  const Text(
                    'પ. પૂ. સંત શ્રી કાનદાસબાપુ  -  પ. પૂ. સંત શ્રી નારાયણ સ્વામી',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Text(
                    'પ્રેરણાસ્ત્રોત: શ્રી પારસીવાડી ભજનધામ (ઘાટકોપર, મુંબઈ.)',
                    style: TextStyle(
                      color: Color(0xffFF7643),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...data
                      .map((e) => GestureDetector(
                            onTap: () {
                              Get.toNamed(e['route']);
                            },
                            child: Container(
                              height: 65,
                              width: 210,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffFFECDF)),
                              child: ListTile(
                                  title: Text(
                                    e['label'],
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontFamily: 'Rasa',
                                      color: Color(0xffFF7643),
                                    ),
                                  ),
                                  leading: SizedBox(
                                    width: 28,
                                    child: SvgPicture.asset(
                                      e['asset'],
                                    ),
                                  )),
                            ),
                          ))
                      .toList()
                ],
              )),
        ),
      ),
    );
  }
}
