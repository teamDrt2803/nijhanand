import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nijhanand/helper/database.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:nijhanand/utils/constants.dart';

class Uploadpage extends StatefulWidget {
  const Uploadpage({Key? key}) : super(key: key);

  @override
  State<Uploadpage> createState() => _UploadpageState();
}

class _UploadpageState extends State<Uploadpage> {
  final lyricsController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Upload ભજન'),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: primaryColor),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'નામ'),
              ),
              TextField(
                controller: lyricsController,
                decoration: const InputDecoration(labelText: 'ભજન'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final bhajanModal = Bhajan(
                        title: titleController.text,
                        lyrics: lyricsController.text);
        
                    await FirestoreDb.addBhajan(bhajanModal);
                    titleController.clear();
                    lyricsController.clear();
                  },
                  child: const Text('Upload'))
            ],
          ),
        ),
      ),
    );
  }
}
