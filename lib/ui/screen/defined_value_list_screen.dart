import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import 'defined_value_screen.dart';

class DefinedValueListScreen extends StatefulWidget {
  const DefinedValueListScreen({super.key});

  @override
  State<DefinedValueListScreen> createState() => _DefinedValueListScreenState();
}

class _DefinedValueListScreenState extends State<DefinedValueListScreen> {
  List<String> valueTypeList = ['isp', 'area', 'pop'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Value'),
      ),
      body: ListView.builder(
          itemCount: valueTypeList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.navigator.pushMaterial(
                    DefinedValueScreen(valueType: valueTypeList[index]));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Center(
                      child: Text(
                    valueTypeList[index].capitalizeFirst(),
                    style: context.textStyles.headlineLarge,
                  )),
                ),
              ),
            );
          }),
    );
  }
}
