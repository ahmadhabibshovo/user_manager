import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/data/repository/fire_store.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';
import 'package:user_manager/ui/widgets/pick_date.dart';

import '../widgets/dropdown_button.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final customerNameTEController = TextEditingController();
  final ispBillTEController = TextEditingController();
  final customerBillTEController = TextEditingController();
  final mobileTEController = TextEditingController();
  final dueTEController = TextEditingController();

  final setValueController = Get.find<SetValueController>();
  @override
  void initState() {
    setValueController.setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SetValueController>(builder: (setValueController) {
          return Visibility(
            visible: !setValueController.loading,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(
              children: [
                Dropdown(
                    name: "ISP",
                    items: setValueController.isp,
                    onChanged: (value) {
                      setValueController.selectedIsp = value;
                    }),
                TextFormField(
                    controller: customerNameTEController,
                    decoration:
                        const InputDecoration(hintText: 'Customer Name')),
                TextFormField(
                  controller: ispBillTEController,
                  decoration: const InputDecoration(hintText: 'ISP Bill'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: customerBillTEController,
                  decoration: const InputDecoration(hintText: 'Customer Bill'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: dueTEController,
                  decoration: const InputDecoration(hintText: 'Customer Due'),
                  keyboardType: TextInputType.number,
                ),
                Dropdown(
                    name: "Area",
                    items: setValueController.area,
                    onChanged: (value) {
                      setValueController.selectedArea = value;
                    }),
                Dropdown(
                    name: 'POP',
                    items: setValueController.pop,
                    onChanged: (value) {
                      setValueController.selectedPop = value;
                    }),
                TextFormField(
                  controller: mobileTEController,
                  decoration: const InputDecoration(hintText: 'Mobile'),
                  keyboardType: TextInputType.number,
                ),
                PickDate(),
                ElevatedButton(
                    onPressed: () {
                      FireStore.add(documentName: 'customer', document: {
                        "isp_name": setValueController.selectedIsp,
                        "customer_name": customerNameTEController.text,
                        "isp_bill": ispBillTEController.text,
                        "customer_bill": customerBillTEController.text,
                        "customer_due": dueTEController.text,
                        "area": setValueController.selectedArea,
                        "pop": setValueController.selectedPop,
                        'mobile': mobileTEController.text,
                        'join': setValueController.joinDate,
                        "isActive": true
                      });
                    },
                    child: const Text('Submit'))
              ].separatedBy(const SizedBox(
                height: 8,
              )),
            ),
          );
        }),
      ),
    );
  }
}
