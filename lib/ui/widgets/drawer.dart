import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/ui/state_holders/filter_controller.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';
import 'package:user_manager/ui/widgets/single_choice.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  String searchQuery = '';
  @override
  void initState() {
    Get.find<SetValueController>().setValues();
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
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
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
          ),
          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setBillStatus(value);
              },
              choices: const ["Due", "Advance"]),
          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setIspFilter(value);
              },
              label: "ISP",
              choices: Get.find<SetValueController>().isp),
          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setActiveStatus(value);
              },
              label: "Area",
              choices: Get.find<SetValueController>().area),
          SingleChoice(
              onSelect: (value) {
                Get.find<FilterController>().setPopFilter(value);
              },
              label: "Pop",
              choices: Get.find<SetValueController>().pop),
        ],
      ),
    );
  }
}
