//Colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:hive_flutter/hive_flutter.dart';



const primaryColor=Color(0xffF2994A);



FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 ValueListenable<Box> bhajanBox=Hive.box('Bhajans').listenable();