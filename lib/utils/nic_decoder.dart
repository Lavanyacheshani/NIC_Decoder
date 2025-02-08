import 'package:intl/intl.dart';

class NICDecoder {
  static Map<String, dynamic> decodeNIC(String nic) {
    String birthYear = "";
    int dayOfYear = 0;
    String gender = "";
    String weekDay = "";
    String formattedDOB = "";
    int age = 0;

    DateTime today = DateTime.now();

    if (nic.length == 10) { // Old NIC (e.g., 853400937V)
      birthYear = "19${nic.substring(0, 2)}";
      dayOfYear = int.parse(nic.substring(2, 5));
    } else if (nic.length == 12) { // New NIC (e.g., 198534000937)
      birthYear = nic.substring(0, 4);
      dayOfYear = int.parse(nic.substring(4, 7));
    } else {
      return {"error": "Invalid NIC format"};
    }

    // Determine gender
    if (dayOfYear > 500) {
      gender = "Female";
      dayOfYear -= 500;
    } else {
      gender = "Male";
    }

    // Using d_array for days in months to calculate the exact birthdate
    List<Map<String, dynamic>> dArray = [
      {'month': 'January', 'days': 31},
      {'month': 'February', 'days': 29},
      {'month': 'March', 'days': 31},
      {'month': 'April', 'days': 30},
      {'month': 'May', 'days': 31},
      {'month': 'June', 'days': 30},
      {'month': 'July', 'days': 31},
      {'month': 'August', 'days': 31},
      {'month': 'September', 'days': 30},
      {'month': 'October', 'days': 31},
      {'month': 'November', 'days': 30},
      {'month': 'December', 'days': 31},
    ];

    String month = '';
    int day = 0;

    // Iterate through the months to calculate the exact month and day
    for (var i = 0; i < dArray.length; i++) {
      if (dArray[i]['days'] < dayOfYear) {
        dayOfYear -= dArray[i]['days'] as int;
      } else {
        month = dArray[i]['month'];
        day = dayOfYear;
        break;
      }
    }

    // Format the birthdate
    DateTime dob = DateTime(int.parse(birthYear), 1, 1).add(Duration(days: dayOfYear - 1));
    formattedDOB = DateFormat('yyyy-MM-dd').format(dob);
    weekDay = DateFormat('EEEE').format(dob);
    age = today.year - dob.year;

    return {
      "birthYear": birthYear,
      "dob": formattedDOB,
      "weekDay": weekDay,
      "gender": gender,
      "age": age
    };
  }
}
