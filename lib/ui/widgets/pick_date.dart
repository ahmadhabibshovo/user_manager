import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:user_manager/ui/state_holders/set_value_controller.dart';

class PickDate extends StatefulWidget {
  PickDate({super.key, this.initDate});
  String? initDate;
  @override
  _PickDateState createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  DateTime? _selectedDate;

  String formatDate(DateTime date) {
    final formatter = DateFormat('d MMM yyyy');
    return formatter.format(date);
  }

  @override
  void initState() {
    if (widget.initDate != null) {
      _selectedDate = DateFormat('d MMM yyyy').parse(widget.initDate!);
    }

    super.initState();
  }
// Example usage:

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
            Get.find<SetValueController>().joinDate = formatDate(pickedDate);
          });
        }
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Join date: ${_selectedDate == null ? 'No date selected' : formatDate(_selectedDate!)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
