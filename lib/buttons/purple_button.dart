import 'package:flutter/material.dart';
import 'package:task_manager_2/widgets/pressable_container.dart';

class PurpleButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool enabled;
  const PurpleButton({
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
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(172, 160, 236, 1),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
