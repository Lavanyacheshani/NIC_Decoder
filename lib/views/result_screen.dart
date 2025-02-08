import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController controller = Get.find<NICController>();

  @override
  Widget build(BuildContext context) {
    final result = controller.result;

    return Scaffold(
      appBar: AppBar(title: Text("NIC Result")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: result.containsKey("error")
            ? Center(child: Text(result["error"], style: TextStyle(color: Colors.red, fontSize: 18)))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIC Format: ${controller.nicNumber.value.length == 10 ? 'Old' : 'New'}", style: TextStyle(fontSize: 18)),
                  Text("Date of Birth: ${result["dob"]}", style: TextStyle(fontSize: 18)),
                  Text("Weekday: ${result["weekDay"]}", style: TextStyle(fontSize: 18)),
                  Text("Age: ${result["age"]} years", style: TextStyle(fontSize: 18)),
                  Text("Gender: ${result["gender"]}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text("Back"),
                  ),
                ],
              ),
      ),
    );
  }
}
