import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/ui/state_holders/filter_controller.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';
import 'package:user_manager/ui/widgets/single_choice.dart';

class DueDrawer extends StatefulWidget {
  const DueDrawer({super.key});

  @override
  DueDrawerState createState() => DueDrawerState();
}

class DueDrawerState extends State<DueDrawer> {
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



        ],
      ),
    );
  }
}
