import 'package:cloud_firestore/cloud_firestore.dart';

Future addOrder(String name, address, contactNumber, stationId, gallons,
    daysToFill, stationName) async {
  final docUser = FirebaseFirestore.instance.collection('Orders').doc();

  final json = {
    'name': name,
    'id': docUser.id,
    'address': address,
    'contactNumber': contactNumber,
    'stationId': stationId,
    'gallons': gallons,
    'daysToFill': daysToFill,
    'type': 'Pending',
    'stationName': stationName
  };

  await docUser.set(json);
}
