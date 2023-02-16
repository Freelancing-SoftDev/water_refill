import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_refill/screens/order_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class StationScreen extends StatelessWidget {
  StationScreen({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 200,
        centerTitle: false,
        backgroundColor: const Color(0xff0B77B5),
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: "Water", fontSize: 40, color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: "Refilling\nApp",
                        fontSize: 40,
                        color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: "Refilling Stations",
                        fontSize: 25,
                        color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minWidth: 370,
                  height: 140,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OrderScreen()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextRegular(
                          text: ('Station: ') + box.read('stationName'),
                          fontSize: 30,
                          color: Colors.black),
                      TextRegular(
                          text: ('Address: ') + box.read('stationAddress'),
                          fontSize: 15,
                          color: Colors.black),
                    ],
                  ),
                  color: const Color(0xffA0D6F4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
