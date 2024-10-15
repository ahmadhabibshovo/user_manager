import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:user_manager/data/repository/fire_store.dart';
import 'package:user_manager/ui/screen/customer_list_screen.dart';
import 'package:user_manager/ui/screen/due_customer_list_screen.dart';
import 'package:user_manager/ui/widgets/capsule_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? totalDue;
  getTotalDue() async {
    totalDue = await FireStore.totalDue();
    setState(() {});
  }

  @override
  void initState() {
    getTotalDue();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Visibility(
        visible: totalDue != null,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    context.navigator.pushMaterial(DueCustomerListScreen());
                  },
                  child: CapsuleContainer(
                      child: Text(
                    'Total Due : ${totalDue}',
                    style: context.textStyles.titleLarge,
                  ))),
              GestureDetector(
                  onTap: () {
                    context.navigator.pushMaterial(DueCustomerListScreen());
                  },
                  child: CapsuleContainer(
                      child: Text(
                    'Payment History',
                    style: context.textStyles.titleLarge,
                  ))),
              GestureDetector(
                  onTap: () {
                    context.navigator.pushMaterial(CustomerListScreen());
                  },
                  child: CapsuleContainer(
                      child: Text(
                    'Customer List',
                    style: context.textStyles.titleLarge,
                  )))
            ].separatedBy(SizedBox(
              height: 20,
            )),
          ),
        ),
      ),
    );
  }
}
