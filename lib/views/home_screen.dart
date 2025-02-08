import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class HomeScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NIC Decoder")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => controller.nicNumber.value = value,
              decoration: InputDecoration(
                labelText: "Enter NIC Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.decodeNIC,
              child: Text("Decode"),
            ),
          ],
        ),
      ),
    );
  }
}
