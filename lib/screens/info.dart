import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Infoscreen extends StatelessWidget {
  const Infoscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
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
                      image:
                          AssetImage('assets/images/santvani_na_mahasagar.png'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
