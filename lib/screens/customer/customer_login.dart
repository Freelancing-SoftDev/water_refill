import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_refill/screens/home_screen.dart';
import 'package:water_refill/widgets/text_widget.dart';

class CustomerLogin extends StatelessWidget {
  CustomerLogin({Key? key}) : super(key: key);

  late String first_name;
  late String last_name;
  late String phone_number;
  late String address;
  late String days;
  final box = GetStorage();
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B77B5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 25),
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
                    first_name = input;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text(
                        'First Name',
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
                    last_name = input;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      fillColor: Colors.white,
                      label: const Text(
                        'Last Name',
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
                    phone_number = input;
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text(
                        'Mobile Number',
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
                    address = input;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_city),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text(
                        'Address',
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
                    username = input;
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
                    password = input;
                  },
                  obscureText: true,
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
                      box.write('firstName', first_name);
                      box.write('lastName', last_name);
                      box.write('mobileNum', phone_number);
                      box.write('myAddress', address);
                      box.write('type', 'customer');
                      box.write('username', username);
                      box.write('password', password);
                      Fluttertoast.showToast(msg: 'Signed up Succesfully!');

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: TextRegular(
                        text: 'Done', fontSize: 25, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
