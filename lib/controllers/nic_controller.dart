import 'package:get/get.dart';
import '../utils/nic_decoder.dart';

class NICController extends GetxController {
  var nicNumber = "".obs;
  var result = {}.obs;

  void decodeNIC() {
    result.value = NICDecoder.decodeNIC(nicNumber.value);
    Get.toNamed('/result');
  }
}
