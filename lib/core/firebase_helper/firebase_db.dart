import 'package:firebase_database/firebase_database.dart';

class FirebaseDB {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
}