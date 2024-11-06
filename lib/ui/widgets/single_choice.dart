import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';

class SingleChoice extends StatefulWidget {
  SingleChoice(
      {super.key,
      required this.choices,
      this.label,
      required this.onSelect,
      required String? selectedValue});
  final List<String> choices;
  final Function(String?) onSelect;
  String? label;
  String? selectedValue;
  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  String? singleSelected;
  @override
  void initState() {
    singleSelected = widget.selectedValue;
    super.initState();
  }

  void setSingleSelected(String? value) {
    setState(() => singleSelected = value);
    widget.onSelect(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: context.textStyles.titleMedium,
          ),
        SizedBox(
          width: double.infinity,
          child: InlineChoice<String>.single(
            clearable: true,
            value: singleSelected,
            onChanged: setSingleSelected,
            itemCount: widget.choices.length,
            itemBuilder: (selection, i) {
              return ChoiceChip(
                selected: selection.selected(widget.choices[i]),
                onSelected: selection.onSelected(widget.choices[i]),
                label: Text(widget.choices[i]),
              );
            },
            listBuilder: ChoiceList.createWrapped(
              spacing: 10,
              runSpacing: 10,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
