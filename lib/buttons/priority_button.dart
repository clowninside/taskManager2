import 'package:flutter/material.dart';

class PriorityButton extends StatefulWidget {
  const PriorityButton({Key? key}) : super(key: key);

  @override
  State<PriorityButton> createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  final items = ['Light', 'Medium', 'Hard'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: items.map(buildMenuItem).toList(),
      onChanged: (value) => setState(() => this.value = value),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
