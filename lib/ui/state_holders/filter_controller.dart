import 'package:get/get.dart';

import '../../data/repository/fire_store.dart';

class FilterController extends GetxController {
  String? activeStatus;
  String? billStatus;
  String? ispFilter;
  String? areaFilter;
  String? popFilter;
  String? searchFilter;
  setActiveStatus(String? value) {
    activeStatus = value;
    update();
  }

  setIspFilter(String? value) {
    ispFilter = value;
    update();
  }

  setBillStatus(String? value) {
    billStatus = value;
    update();
  }

  setAreaFilter(String? value) {
    areaFilter = value;
    update();
  }

  setPopFilter(String? value) {
    popFilter = value;
    update();
  }

  setSearchFilter(String? value) {
    searchFilter = value;
    update();
  }

  filteredDocument() {
    return FireStore.get(documentName: 'customer');
  }
}
