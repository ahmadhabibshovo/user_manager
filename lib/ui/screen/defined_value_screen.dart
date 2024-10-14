import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_manager/ui/widgets/input_dialog.dart';

import '../../data/repository/fire_store.dart';

class DefinedValueScreen extends StatefulWidget {
  const DefinedValueScreen({super.key, required this.valueType});
  final String valueType;
  @override
  State<DefinedValueScreen> createState() => _DefinedValueScreenState();
}

class _DefinedValueScreenState extends State<DefinedValueScreen> {
  late final CollectionReference documentList;
  @override
  void initState() {
    documentList = FireStore.get(documentName: widget.valueType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All ${widget.valueType.capitalizeFirst()}'),
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
              print(data);
              return Dismissible(
                key: Key(index.toString()),
                onDismissed: (direction) {
                  FireStore.delete(data[index].id, widget.valueType);
                  setState(() {});
                },
                child: Stack(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Center(
                            child: Text(
                          data[index]['name'],
                          style: context.textStyles.headlineLarge,
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () async {
                            var name = await InputDialog.showTextInputDialog(
                                item: widget.valueType,
                                context: context,
                                value: data[index]['name']);
                            if (name != null) {
                              setState(() {
                                FireStore.update(
                                    data: {"name": name},
                                    docName: widget.valueType,
                                    id: data[index].id);
                              });
                            }
                          },
                          icon: Icon(Icons.edit)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var name = await InputDialog.showTextInputDialog(
              context: context, item: widget.valueType);
          if (name != null) {
            setState(() {
              FireStore.add(
                document: {"name": name},
                documentName: widget.valueType,
              );
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
