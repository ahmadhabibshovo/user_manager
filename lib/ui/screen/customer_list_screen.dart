import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/data/repository/fire_store.dart';
import 'package:user_manager/ui/screen/customer_details_screen.dart';
import 'package:user_manager/ui/screen/defined_value_list_screen.dart';
import 'package:user_manager/ui/screen/edit_user.dart';
import 'package:user_manager/ui/state_holders/filter_controller.dart';
import 'package:user_manager/ui/widgets/drawer.dart';
import 'package:user_manager/ui/widgets/payment_dialog.dart';

import 'add_user_screen.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Customer List'),
        actions: [
          IconButton(
              onPressed: () {
                context.navigator.pushMaterial(DefinedValueListScreen());
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: GetBuilder<FilterController>(builder: (filterController) {
        return StreamBuilder<QuerySnapshot>(
          stream: filterController
              .filteredDocument(FireStore.get(documentName: 'customer'))
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return GetBuilder<FilterController>(builder: (controller) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs;
                  print(data[index]['customer_name']);
                  return Visibility(
                    visible: controller.searchFilter == null
                        ? true
                        : (data[index]["customer_name"] as String)
                                .toUpperCase()
                                .contains(
                                    controller.searchFilter!.toUpperCase()) &&
                            (controller.activeStatus == 'All' ||
                                    controller.activeStatus == null
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      FireStore.delete(
                                          data[index].id, "customer");
                                    },
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {
                                      context.navigator
                                          .pushMaterial(EditUserScreen(
                                        user: data[index],
                                      ));
                                    },
                                    icon: Icon(Icons.edit)),
                                PopupMenuButton<String>(
                                  onSelected: (newValue) async {
                                    if (newValue == "Active") {
                                      FireStore.update(
                                          data: {
                                            "isActive": !data[index]['isActive']
                                          },
                                          docName: 'customer',
                                          id: data[index].id);
                                    }
                                    if (newValue == "Payment") {
                                      var amount = await PaymentDialog
                                          .showTextInputDialog(
                                              context: context,
                                              username: data[index]
                                                  ['customer_name']);
                                      if (amount != null) {
                                        FireStore.update(
                                            data: {
                                              'customer_due': data[index]
                                                      ['customer_due'] -
                                                  int.parse(amount)
                                            },
                                            docName: 'customer',
                                            id: data[index].id);
                                        FireStore.add(
                                            documentName: 'payment',
                                            document: {
                                              'id': data[index].id,
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            });
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigator.pushMaterial(const AddUserScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
