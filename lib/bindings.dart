import 'package:get/get.dart';
import 'package:user_manager/ui/state_holders/customer_controller.dart';
import 'package:user_manager/ui/state_holders/filter_controller.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetValueController(), fenix: true);
    Get.lazyPut(() => CustomerController());
    Get.lazyPut(() => FilterController());
  }
}
