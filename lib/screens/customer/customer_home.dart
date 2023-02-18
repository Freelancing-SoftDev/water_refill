import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
                text: 'Stations',
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
                                  text:
                                      '${data.docs[index]['name']} (${data.docs[index]['open']} -${data.docs[index]['close']})',
                                  fontSize: 14,
                                  color: Colors.black),
                              subtitle: TextBold(
                                  text: '${data.docs[index]['address']}',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: IconButton(
                                onPressed: (() {
                                  box.write('stationId', data.docs[index].id);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OrderScreen()));
                                }),
                                icon: const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                }),
            StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return ListView.builder(itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: TextBold(
                              text: 'Refilling Station #$index',
                              fontSize: 16,
                              color: Colors.black),
                          subtitle: TextBold(
                              text: 'Cogon, CDO - 09090104355',
                              fontSize: 12,
                              color: Colors.grey),
                          trailing: TextBold(
                              text: '2 Gallons',
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
