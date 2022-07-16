import 'package:hive/hive.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:nijhanand/utils/constants.dart';

class FirestoreDb {
  static final box = Hive.box('app_config');
  static getLastUpdated() => box.get(
        Constants.lastUpdated,
        defaultValue: DateTime.now().millisecondsSinceEpoch,
      );
  static addBhajan(Bhajan bhajanModal) async {
    firebaseFirestore
        .collection('app_config')
        .doc('X0BblWubPMj13hHAg718')
        .set({Constants.lastUpdated: DateTime.now().millisecondsSinceEpoch});

    return firebaseFirestore
        .collection('Bhajans')
        .doc(bhajanModal.title)
        .set(bhajanModal.toJson());
  }

  static Stream<List<Bhajan>> get bhajanStream => firebaseFirestore
      .collection('Bhajans')
      .snapshots()
      .map((event) => event.docs.map(Bhajan.fromJson).toList());
  static Stream<bool> get hasUpdateStream => firebaseFirestore
          .collection('app_config')
          .doc('X0BblWubPMj13hHAg718')
          .snapshots()
          .distinct((a, b) =>
              a.data()?[Constants.lastUpdated] ==
              b.data()?[Constants.lastUpdated])
          .map((event) {
        final lastUpdated = event.data()?[Constants.lastUpdated];
        if (lastUpdated == null) {
          return true;
        }
        if (lastUpdated != getLastUpdated()) {
          box.put(Constants.lastUpdated, lastUpdated);
          return true;
        }
        return false;
      });
}
