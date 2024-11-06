import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:user_manager/ui/screen/customer_list_screen.dart';
import 'package:user_manager/ui/screen/defined_value_list_screen.dart';
import 'package:user_manager/ui/screen/due_customer_list_screen.dart';
import 'package:user_manager/ui/screen/payment_history_nav_screen.dart';
import 'package:user_manager/ui/state_holders/total_due_controller.dart';
import 'package:user_manager/ui/widgets/capsule_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<TotalDueController>().getTotalDue();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          actions: [
            IconButton(
                onPressed: () {
                  context.navigator.pushMaterial(DefinedValueListScreen());
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: ConnectivityBuilder(builder: (status) {
          if (status == ConnectivityStatus.online) {
            return GetBuilder<TotalDueController>(
                builder: (totalDueController) {
              return Visibility(
                visible: totalDueController.inProgress,
                replacement: const Center(
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
                            context.navigator
                                .pushMaterial(const DueCustomerListScreen());
                          },
                          child: CapsuleContainer(
                              child: Text(
                            'Total Due : ${totalDueController.totalDue}',
                            style: context.textStyles.titleLarge,
                          ))),
                      GestureDetector(
                          onTap: () {
                            context.navigator
                                .pushMaterial(const PaymentHistoryNavScreen());
                          },
                          child: CapsuleContainer(
                              child: Text(
                            'Payment History',
                            style: context.textStyles.titleLarge,
                          ))),
                      GestureDetector(
                          onTap: () {
                            context.navigator
                                .pushMaterial(const CustomerListScreen());
                          },
                          child: CapsuleContainer(
                              child: Text(
                            'Customer List',
                            style: context.textStyles.titleLarge,
                          )))
                    ].separatedBy(const SizedBox(
                      height: 20,
                    )),
                  ),
                ),
              );
            });
          } else if (status == ConnectivityStatus.offline) {
            return Center(child: Text("Ofline"));
          } else {
            return Center(child: Text("Loading"));
          }
        }));
  }
}
