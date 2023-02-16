import 'package:flutter/material.dart';
import 'package:water_refill/screens/customer/order_screen.dart';
import 'package:water_refill/screens/home_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

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
                              text:
                                  'Refilling Station #$index (08:00 AM - 04:00 PM)',
                              fontSize: 14,
                              color: Colors.black),
                          subtitle: TextBold(
                              text: 'Cogon, CDO - 09090104355',
                              fontSize: 12,
                              color: Colors.grey),
                          trailing: IconButton(
                            onPressed: (() {
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
