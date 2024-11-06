import 'package:get/get.dart';

import '../../data/repository/fire_store.dart';

class TotalDueController extends GetxController {
  bool inProgress = false;
  int totalDue = 0;

  getTotalDue() async {
    totalDue = await FireStore.totalDue();
    inProgress = true;
    update();
  }
}
