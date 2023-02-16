import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_refill/screens/customer/customer_home.dart';
import 'package:water_refill/screens/customer/customer_login.dart';
import 'package:water_refill/screens/seller/seller_home.dart';
import 'package:water_refill/screens/seller/seller_login.dart';
import 'package:water_refill/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  final box = GetStorage();

  late String newUsername;
  late String newPassword;

  @override
  Widget build(BuildContext context) {
    print(box.read('type'));
    return Scaffold(
      backgroundColor: const Color(0xff0B77B5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 220, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: "Water", fontSize: 75, color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextRegular(
                        text: "Refilling\nApp",
                        fontSize: 75,
                        color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 28, right: 28),
                child: TextFormField(
                  onChanged: (String input) {
                    newUsername = input;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text(
                        'Username',
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
                    newPassword = input;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text(
                        'Password',
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
                      if (box.read('type') == 'customer') {
                        if (box.read('username') == newUsername &&
                            box.read('password') == newPassword) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CustomerHome()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: TextRegular(
                                  text: 'Invalid Account',
                                  fontSize: 12,
                                  color: Colors.white)));
                        }
                      } else {
                        if (box.read('username') == newUsername &&
                            box.read('password') == newPassword) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SellerHome()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: TextRegular(
                                  text: 'Invalid Account',
                                  fontSize: 12,
                                  color: Colors.white)));
                        }
                      }
                    },
                    child: TextRegular(
                        text: 'Log-in', fontSize: 25, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    minWidth: 200,
                    height: 55,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CustomerLogin()));
                    },
                    child: TextRegular(
                        text: 'Sign-up', fontSize: 25, color: Colors.black)),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SellerLogin()));
                    }),
                    child: TextRegular(
                        text: 'Sign-up as supplier',
                        fontSize: 18,
                        color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
