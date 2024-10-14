import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:user_manager/data/repository/fire_store.dart';

String formatDate(DateTime date) {
  final formatter = DateFormat('d MMM yyyy');
  return formatter.format(date);
}

class SetValueController extends GetxController {
  bool loading = true;
  String joinDate = formatDate(DateTime.now());
  String selectedPop = '';
  String selectedIsp = '';
  String selectedArea = '';

  List<String> pop = [];
  List<String> isp = [];
  List<String> area = [];

  setValues() async {
    pop = await FireStore.getValueList(docName: 'pop');
    selectedPop = pop.first;
    isp = await FireStore.getValueList(docName: 'isp');
    selectedIsp = isp.first;
    area = await FireStore.getValueList(docName: 'area');
    selectedArea = area.first;
    loading = false;
    update();
  }
}
