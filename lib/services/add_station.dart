import 'package:cloud_firestore/cloud_firestore.dart';

Future addStation(String name, address, open, close) async {
  final docUser = FirebaseFirestore.instance.collection('Stations').doc();

  final json = {
    'name': name,
    'id': docUser.id,
    'address': address,
    'open': open,
    'close': close
  };

  await docUser.set(json);
}
