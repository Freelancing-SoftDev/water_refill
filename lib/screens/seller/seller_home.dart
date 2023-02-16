import 'package:flutter/material.dart';
import 'package:water_refill/widgets/text_widget.dart';

class SellerHome extends StatelessWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title:
            TextBold(text: 'Supplier Name', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: TextBold(
                text: 'List of Orders', fontSize: 18, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: TextBold(
                          text: 'Impasugong Bukidnon',
                          fontSize: 16,
                          color: Colors.black),
                      subtitle: TextBold(
                          text: 'John Doe - 09090104355',
                          fontSize: 12,
                          color: Colors.grey),
                      trailing: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
