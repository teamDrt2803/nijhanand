import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:nijhanand/utils/constants.dart';

class FirestoreDb {
  static addBhajan(Bhajan bhajanModal) async {
    return firebaseFirestore
        .collection('Bhajans')
        .doc(bhajanModal.title)
        .set(bhajanModal.toJson());
  }

   static Stream<List<Bhajan>> get bhajanStream => firebaseFirestore
      .collection('Bhajans')
      .snapshots()
      .map((event) => event.docs.map(Bhajan.fromJson).toList());

   
}
