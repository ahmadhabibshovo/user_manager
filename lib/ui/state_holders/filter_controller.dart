import 'package:get/get.dart';

class FilterController extends GetxController {
  String? activeStatus = 'All';
  String? billStatus = "All";
  String? ispFilter = "All";
  String? areaFilter = "All";
  String? popFilter = "All";
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

  filteredDocument(dynamic data) {
    if (activeStatus == 'Active') {
      data = data.where('isActive', isEqualTo: true);
    } else if (activeStatus == 'Deactive') {
      data = data.where('isActive', isEqualTo: false);
    }
    if (billStatus == 'Due') {
      data = data.where('customer_due', isGreaterThan: 0);
    } else if (billStatus == 'Advance') {
      data = data.where('customer_due', isLessThan: 0);
    }
    if (popFilter != 'All') {
      data = data.where('pop', isEqualTo: popFilter);
    }
    if (areaFilter != 'All') {
      data = data.where('area', isEqualTo: areaFilter);
    }
    if (ispFilter != 'All') {
      data = data.where('isp_name', isEqualTo: ispFilter);
    }

    return data;
  }
}
