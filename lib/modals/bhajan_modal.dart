import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';


part 'bhajan_modal.g.dart';
@HiveType(typeId: 0)
class Bhajan extends HiveObject {
  @HiveField(0)
  String? documentId;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String lyrics;

  Bhajan({required this.title, required this.lyrics});

  factory Bhajan.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();
    return Bhajan(
      title: data["Title"],
      lyrics: documentSnapshot["Lyrics"],
    );
  }

  Map<String, dynamic> toJson() => {'Title': title, 'Lyrics': lyrics};

}
