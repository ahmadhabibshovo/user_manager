import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/data/repository/fire_store.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';
import 'package:user_manager/ui/widgets/pick_date.dart';

import '../widgets/dropdown_button.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, required this.user});
  final user;
  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final customerNameTEController = TextEditingController();
  final ispBillTEController = TextEditingController();
  final customerBillTEController = TextEditingController();
  final dueTEController = TextEditingController();
  final mobileTEController = TextEditingController();
  String? pop;
  String? isp;
  String? area;
  String? selectedDate;
  final setValueController = Get.find<SetValueController>();
  @override
  void initState() {
    area = widget.user["area"];
    pop = widget.user["pop"];
    isp = widget.user["isp_name"];
    selectedDate = widget.user["join"];
    setValueController.setValues();
    customerNameTEController.text = widget.user["customer_name"];
    ispBillTEController.text = widget.user["isp_bill"];
    customerBillTEController.text = widget.user["customer_bill"];
    dueTEController.text = widget.user["customer_due"];
    mobileTEController.text = widget.user['mobile'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
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
                    initialValue: isp,
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
                    initialValue: area,
                    items: setValueController.area,
                    onChanged: (value) {
                      setValueController.selectedArea = value;
                    }),
                Dropdown(
                    initialValue: pop,
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
                PickDate(
                  initDate: selectedDate,
                ),
                ElevatedButton(
                    onPressed: () {
                      FireStore.update(
                          id: widget.user.id,
                          docName: 'customer',
                          data: {
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
                      Navigator.pop(context);
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
