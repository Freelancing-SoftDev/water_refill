import 'package:flutter/material.dart';
import 'package:water_refill/screens/customer/order_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: TextBold(
            text: 'List of Refilling Stations',
            fontSize: 18,
            color: Colors.white),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: (() {
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (context) => OrderScreen()));
        //   }),
        //   icon: const Icon(Icons.arrow_back),
        // ),
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
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
              trailing: IconButton(
                onPressed: (() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => OrderScreen()));
                }),
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        );
      })),
    );
  }
}
