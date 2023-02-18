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
            title: TextBold(text: 'HOME', fontSize: 18, color: Colors.white),
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
            StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return ListView.builder(itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          subtitle: TextBold(
                              text: 'Refilling Station #$index',
                              fontSize: 12,
                              color: Colors.grey),
                          title: TextBold(
                              text: 'John Doe - 2 Gallons',
                              fontSize: 16,
                              color: Colors.black),
                          trailing: TextBold(
                              text: 'January 25, 2023',
                              fontSize: 14,
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
