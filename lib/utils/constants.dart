//Colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../modals/bhajan_modal.dart';

const primaryColor = Color(0xffFE3D0A);

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class Constants {
  static const lastUpdated = 'lastUpdate';
}

class Boxes {
  final bhajanBox = Hive.box<Bhajan>('Bhajans');
  final favouriteBox = Hive.box('favorites');
}
