import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onChanged;
  final String name;
  final String? initialValue;
  const Dropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.name,
    this.initialValue,
  });

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select ${widget.name} : ',
              style: context.textStyles.bodyLarge,
            ),
            DropdownButton<String>(
              value: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                  widget.onChanged(value!); // Ensure value is not null
                });
              },
              items: widget.items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
