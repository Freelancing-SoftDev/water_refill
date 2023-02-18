import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_refill/screens/home_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class SellerHome extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
          title: TextBold(
              text: box.read('station_name') ?? 'Home',
              fontSize: 18,
              color: Colors.white),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Orders')
                            .where('stationName',
                                isEqualTo: box.read('stationName'))
                            .where('type', isEqualTo: 'Pending')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print('error');

                            print(snapshot.error);

                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            child: ListView.builder(
                                itemCount: data.docs.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                    child: Card(
                                      elevation: 3,
                                      child: ListTile(
                                        onTap: (() {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: ((context) {
                                                return SizedBox(
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        onTap: (() async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Orders')
                                                              .doc(data
                                                                  .docs[index]
                                                                  .id)
                                                              .update({
                                                            'type': 'Accepted'
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: TextBold(
                                                            text:
                                                                'Accept Order',
                                                            fontSize: 14,
                                                            color:
                                                                Colors.green),
                                                        trailing: const Icon(
                                                          Icons
                                                              .check_circle_outline,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: (() async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Orders')
                                                              .doc(data
                                                                  .docs[index]
                                                                  .id)
                                                              .update({
                                                            'type': 'Rejected'
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: TextBold(
                                                            text:
                                                                'Reject Order',
                                                            fontSize: 14,
                                                            color: Colors.red),
                                                        trailing: const Icon(
                                                          Icons.close_sharp,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }));
                                        }),
                                        title: TextBold(
                                            text: data.docs[index]['address'],
                                            fontSize: 16,
                                            color: Colors.black),
                                        subtitle: TextBold(
                                            text:
                                                '${data.docs[index]['name']} - ${data.docs[index]['contactNumber']}',
                                            fontSize: 12,
                                            color: Colors.grey),
                                        trailing: TextBold(
                                            color: Colors.black,
                                            fontSize: 18,
                                            text:
                                                '${data.docs[index]['gallons']} Gallons'),
                                      ),
                                    ),
                                  );
                                })),
                          );
                        }),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Orders')
                            .where('stationName',
                                isEqualTo: box.read('stationName'))
                            .where('type', isEqualTo: 'Accepted')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print('error');

                            print(snapshot.error);

                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            child: ListView.builder(
                                itemCount: data.docs.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                    child: Card(
                                      elevation: 3,
                                      child: ListTile(
                                        title: TextBold(
                                            text: data.docs[index]['name'],
                                            fontSize: 16,
                                            color: Colors.black),
                                        subtitle: TextBold(
                                            text:
                                                '${data.docs[index]['address']}- ${data.docs[index]['contactNumber']}',
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
                                })),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
