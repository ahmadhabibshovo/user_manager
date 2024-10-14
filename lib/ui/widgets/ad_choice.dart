import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

class ADChoice extends StatefulWidget {
  const ADChoice({super.key});

  @override
  _ADChoiceState createState() => _ADChoiceState();
}

class _ADChoiceState extends State<ADChoice> {
  List<String> choices = ['Choice 1', 'Choice 2', 'Choice 3'];
  List<bool> isChoiceActive = [false, false, false];

  void _toggleChoiceActive(int index) {
    setState(() {
      isChoiceActive[index] = !isChoiceActive[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Active Status:",
          style: context.textStyles.headlineMedium,
        ),
        ListView.builder(
          itemCount: choices.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(choices[index]),
              trailing: Switch(
                value: isChoiceActive[index],
                onChanged: (value) {
                  _toggleChoiceActive(index);
                },
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.grey,
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
              ),
            );
          },
        ),
      ],
    );
  }
}
