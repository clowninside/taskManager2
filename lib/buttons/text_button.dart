import 'package:flutter/material.dart';
import 'package:task_manager_2/widgets/pressable_container.dart';

class CustomTextButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool enabled;
  const CustomTextButton({
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
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    );
  }
}
