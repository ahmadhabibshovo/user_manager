import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/ui/state_holders/filter_controller.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';
import 'package:user_manager/ui/widgets/single_choice.dart';

class Due_Drawer extends StatefulWidget {
  const Due_Drawer({super.key});

  @override
  Due_DrawerState createState() => Due_DrawerState();
}

class Due_DrawerState extends State<Due_Drawer> {
  final search = TextEditingController();
  @override
  void initState() {
    Get.find<SetValueController>().setValues();
    search.text = Get.find<FilterController>().searchFilter ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
// DrawerHeader

          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Select Search Filter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

// Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: search,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  Get.find<FilterController>().setSearchFilter(value);
                });
              },
            ),
          ),
          SingleChoice(
            choices: const ["All", "Active", "Deactive"],
            onSelect: (value) {
              Get.find<FilterController>().setActiveStatus(value);
            },
            selectedValue: Get.find<FilterController>().activeStatus,
          ),

          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setIspFilter(value);
              },
              label: "ISP",
              choices: ["All", ...Get.find<SetValueController>().isp],
              selectedValue: Get.find<FilterController>().ispFilter),
          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setActiveStatus(value);
              },
              label: "Area",
              choices: ["All", ...Get.find<SetValueController>().area],
              selectedValue: Get.find<FilterController>().areaFilter),
          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setPopFilter(value);
              },
              label: "Pop",
              choices: ["All", ...Get.find<SetValueController>().pop],
              selectedValue: Get.find<FilterController>().areaFilter),
        ],
      ),
    );
  }
}
