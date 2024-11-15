import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:user_manager/data/repository/fire_store.dart';
import 'package:user_manager/ui/screen/customer_details_screen.dart';
import 'package:user_manager/ui/state_holders/filter_controller.dart';
import 'package:user_manager/ui/widgets/due_drawer.dart';

import '../widgets/payment_dialog.dart';

class DueCustomerListScreen extends StatefulWidget {
  const DueCustomerListScreen({super.key});

  @override
  State<DueCustomerListScreen> createState() => _DueCustomerListScreenState();
}

class _DueCustomerListScreenState extends State<DueCustomerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DueDrawer(),
      appBar: AppBar(
        title: const Text('Due Customer'),
      ),
      body: GetBuilder<FilterController>(builder: (filterController) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('customer')
              .where('customer_due', isGreaterThan: 0)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs;

                return Visibility(
                  visible: filterController.searchFilter == null
                      ? true
                      : (data[index]["customer_name"] as String)
                      .toUpperCase()
                      .contains(
                      filterController.searchFilter!.toUpperCase()) &&
                      (filterController.activeStatus == 'All' ||
                          filterController.activeStatus == null
                          ? true
                          : data[index]['isActive'] == false),
                  child: GestureDetector(
                    onTap: () {
                      context.navigator.pushMaterial(
                          CustomerDetailsScreen(customer: data[index]));
                    },
                    child: Stack(
                      children: [
                        ListTile(
                            title: Text(
                          data[index]['customer_name'],
                        )),
                        Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<String>(
                            onSelected: (newValue) async {
                              if (newValue == "Active") {
                                FireStore.update(
                                    data: {"isActive": !data[index]['isActive']},
                                    docName: 'customer',
                                    id: data[index].id);
                              }
                              if (newValue == "Payment") {
                                var amount =
                                    await PaymentDialog.showTextInputDialog(
                                        context: context,
                                        username: data[index]['customer_name']);
                                if (amount != null) {
                                  FireStore.update(data: {
                                    'customer_due': data[index]['customer_due'] -
                                        int.parse(amount)
                                  }, docName: 'customer', id: data[index].id);
                                  FireStore.add(
                                      documentName: 'payment',
                                      document: {
                                        'id': data[index].id,
                                        'name': data[index]['customer_name'],
                                        'time': DateTime.now(),
                                        'amount': int.parse(amount)
                                      });
                                }
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'Payment',
                                  child: Text('Payment'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Active',
                                  child: Text(data[index]['isActive']
                                      ? 'DeActivate'
                                      : "Activate"),
                                ),
                              ];
                            },
                            child: const Icon(Icons
                                .menu), // Replace with your desired button child
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
