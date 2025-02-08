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
            ? Center(
                child: Text(
                  result["error"],
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.credit_card, "NIC Format",
                      controller.nicNumber.value.length == 10 ? 'Old' : 'New'),
                  _buildInfoRow(Icons.cake, "Date of Birth", result["dob"]),
                  _buildInfoRow(
                      Icons.calendar_today, "Weekday", result["weekDay"]),
                  _buildInfoRow(
                      Icons.access_time, "Age", "${result["age"]} years"),
                  _buildInfoRow(Icons.male, "Gender", result["gender"]),
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

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          SizedBox(width: 10),
          Text(
            "$title: $value",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
