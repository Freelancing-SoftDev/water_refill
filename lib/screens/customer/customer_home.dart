import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_refill/screens/customer/maps_screen.dart';
import 'package:water_refill/screens/customer/order_screen.dart';
import 'package:water_refill/screens/home_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class CustomerHome extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MapSample()));
                }),
                icon: const Icon(Icons.map)),
            actions: [
              IconButton(
                onPressed: (() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
                icon: const Icon(Icons.logout),
              ),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            title: TextBold(text: 'HOME', fontSize: 18, color: Colors.white),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Orders',
              ),
              Tab(
                text: 'History',
              ),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrderScreen()));
              }),
              child: const Icon(Icons.add)),
          body: TabBarView(children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Orders')
                    .where('type', isEqualTo: 'Pending')
                    .where('name',
                        isEqualTo: box.read('firstName') + box.read('lastName'))
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print('error');

                    print(snapshot.error);

                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: TextBold(
                                  text: data.docs[index]['name'] +
                                      ' - ' +
                                      data.docs[index]['type'],
                                  fontSize: 16,
                                  color: Colors.black),
                              subtitle: TextBold(
                                  text:
                                      '${data.docs[index]['address']} - ${data.docs[index]['contactNumber']}',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: TextBold(
                                  text:
                                      '${data.docs[index]['gallons']} Gallons',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        );
                      }));
                }),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Orders')
                    .where('type', isEqualTo: 'Accepted')
                    .where('name',
                        isEqualTo: box.read('firstName') + box.read('lastName'))
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print('error');

                    print(snapshot.error);

                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: TextBold(
                                  text: data.docs[index]['name'] +
                                      ' - ' +
                                      data.docs[index]['type'],
                                  fontSize: 16,
                                  color: Colors.black),
                              subtitle: TextBold(
                                  text:
                                      '${data.docs[index]['address']} - ${data.docs[index]['contactNumber']}',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: TextBold(
                                  text:
                                      '${data.docs[index]['gallons']} Gallons',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        );
                      }));
                }),
          ])),
    );
  }
}
