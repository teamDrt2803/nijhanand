import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:share_plus/share_plus.dart';

class Lyrics extends StatefulWidget {
  const Lyrics({Key? key}) : super(key: key);

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  double _fontSize = 18.0;
  bool _showSlider = false;

  void _changeFontSize(double value) {
    setState(() {
      _fontSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bhajan = Get.arguments["bhajan"] as Bhajan;
    return Scaffold(
      backgroundColor: const Color(0xffFAEFE7),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAEFE7),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff3B3B3E),
            )),
        title: Text(
          bhajan.title,
          style: const TextStyle(
            fontFamily: 'Rasa',
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Color(0xff3B3B3E),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: SelectableText(
            bhajan.lyrics,
            style: TextStyle(
              fontFamily: 'Kohinoor Gujarati',
              fontSize: _fontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xff131212),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_showSlider)
              Slider(
                activeColor: const Color(0xffF38E61),
                inactiveColor: const Color(0xffF1EEE9),
                value: _fontSize,
                min: 14,
                max: 30,
                onChanged: _changeFontSize,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Share.share(
                      bhajan.lyrics,
                    );
                  },
                  icon: const Icon(Icons.share_rounded),
                  color: const Color(0xff787881),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showSlider = !_showSlider;
                    });
                  },
                  icon: const Icon(Icons.format_size),
                  color: const Color(0xff787881),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
