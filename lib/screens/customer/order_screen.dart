import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_refill/screens/customer/customer_home.dart';
import 'package:water_refill/services/add_order.dart';
import 'package:water_refill/widgets/text_widget.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  late String gallons;
  late String days;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: (() {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CustomerHome()));
            Navigator.of(context).pop();
          }),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: const Color(0xff0B77B5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: 'Station Name',
                        fontSize: 32,
                        color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: 'Address: Station Address',
                        fontSize: 18,
                        color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 28, right: 28),
                child: TextFormField(
                  onChanged: (String input) {
                    gallons = input;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.add_box),
                      fillColor: Colors.white,
                      label: const Text(
                        'Number of Gallons',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 28, right: 28),
                child: TextFormField(
                  onChanged: (String input) {
                    days = input;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.add_box),
                      fillColor: Colors.white,
                      label: const Text(
                        'Number of Days to Fill',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 185),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    minWidth: 150,
                    height: 55,
                    onPressed: () {
                      addOrder(
                          box.read('firstName') + '' + box.read('lastName') ??
                              '',
                          box.read('myAddress') ?? '',
                          box.read('mobileNum') ?? '',
                          box.read('stationId') ?? '',
                          gallons,
                          days,
                          box.read('stationName') ?? '');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: TextRegular(
                              text: 'Order placed!',
                              fontSize: 12,
                              color: Colors.white)));
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CustomerHome()));
                    },
                    child: TextRegular(
                        text: 'Place Order',
                        fontSize: 25,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
