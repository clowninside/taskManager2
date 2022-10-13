import 'package:flutter/material.dart';
import 'package:task_manager_2/widgets/pressable_container.dart';

class GreyButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool enabled;
  const GreyButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableContainer(
      onPress: enabled ? onPress : () {},
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(217, 217, 217, 1),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
