import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_manager/data/repository/fire_store.dart';
import 'package:user_manager/ui/screen/customer_details_screen.dart';
import 'package:user_manager/ui/screen/edit_user.dart';
import 'package:user_manager/ui/widgets/drawer.dart';

import 'add_user_screen.dart';

class DueCustomerListScreen extends StatefulWidget {
  const DueCustomerListScreen({super.key});

  @override
  State<DueCustomerListScreen> createState() => _DueCustomerListScreenState();
}

class _DueCustomerListScreenState extends State<DueCustomerListScreen> {
  late final CollectionReference documentList;
  @override
  void initState() {
    documentList = FirebaseFirestore.instance.collection('customer')
      ..where('customer_due', isGreaterThan: 0);
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Due Customer'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: documentList.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs;
              print(data[index]['customer_name']);
              return GestureDetector(
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
                                FireStore.delete(data[index].id, "customer");
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                context.navigator.pushMaterial(EditUserScreen(
                                  user: data[index],
                                ));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigator.pushMaterial(const AddUserScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
