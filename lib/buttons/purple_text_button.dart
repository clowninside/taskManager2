import 'package:flutter/material.dart';
import 'package:task_manager_2/widgets/pressable_container.dart';

class PurpleTextButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool enabled;
  const PurpleTextButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableContainer(
      onPress: enabled ? onPress : () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(172, 160, 236, 1),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
