import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:water_refill/screens/home_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
            title:
                TextBold(text: 'ADMIN HOME', fontSize: 18, color: Colors.white),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Stations',
              ),
              Tab(
                text: 'Orders',
              ),
              Tab(
                text: 'History',
              ),
            ]),
          ),
          body: TabBarView(children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Stations')
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
                                  text: data.docs[index]['name'],
                                  fontSize: 16,
                                  color: Colors.black),
                              subtitle: TextBold(
                                  text: '${data.docs[index]['address']}',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: TextBold(
                                  text:
                                      '(${data.docs[index]['open']} - ${data.docs[index]['close']})',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        );
                      }));
                }),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Orders')
                    .where('type', isEqualTo: 'Pending')
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
                                  text:
                                      data.docs[index]['gallons'] + ' Gallons',
                                  fontSize: 16,
                                  color: Colors.black),
                              subtitle: TextBold(
                                  text:
                                      '${data.docs[index]['name']}- ${data.docs[index]['address']}',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: TextBold(
                                  text:
                                      '${int.parse(data.docs[index]['gallons']) * 25} pesos',
                                  fontSize: 18,
                                  color: Colors.green),
                            ),
                          ),
                        );
                      }));
                }),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Orders')
                    .where('type', isEqualTo: 'Accepted')
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
                                  text:
                                      data.docs[index]['gallons'] + ' Gallons',
                                  fontSize: 16,
                                  color: Colors.black),
                              subtitle: TextBold(
                                  text:
                                      '${data.docs[index]['name']}- ${data.docs[index]['stationName']}',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: TextBold(
                                  text:
                                      '${int.parse(data.docs[index]['gallons']) * 25} pesos',
                                  fontSize: 18,
                                  color: Colors.green),
                            ),
                          ),
                        );
                      }));
                }),
          ])),
    );
  }
}
