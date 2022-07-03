import 'package:cloud_firestore/cloud_firestore.dart';

class Bhajan {
  String? documentId;
  late String title;
  late String lyrics;

  Bhajan({required this.title, required this.lyrics});

  factory Bhajan.fromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();
    return Bhajan(
      title: data["Title"],
      lyrics: documentSnapshot["Lyrics"],
    );
  }

  Map<String, dynamic> toJson() => {'Title': title, 'Lyrics': lyrics};

  static Bhajan fromJson(Map<String, dynamic> json) =>
      Bhajan(title: json['Title'], lyrics: json['Lyrics']);
}
