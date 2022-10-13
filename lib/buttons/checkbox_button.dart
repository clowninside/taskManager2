import 'package:flutter/material.dart';
import 'package:task_manager_2/widgets/pressable_container.dart';

class CheckBoxButton extends StatefulWidget {
  final Function onPress;
  const CheckBoxButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  State<CheckBoxButton> createState() => _CheckBoxButtonState();
}

class _CheckBoxButtonState extends State<CheckBoxButton> {
  Color _containerColor = const Color.fromRGBO(239, 232, 255, 1);
  Color _iconColor = const Color.fromRGBO(207, 210, 228, 1);

  @override
  Widget build(BuildContext context) {
    return PressableContainer(
      onPress: () {
        setState(() {
          _containerColor =
              _containerColor == const Color.fromRGBO(172, 160, 236, 1)
                  ? const Color.fromRGBO(239, 232, 255, 1)
                  : const Color.fromRGBO(172, 160, 236, 1);
          _iconColor = _iconColor == Colors.white
              ? const Color.fromRGBO(207, 210, 228, 1)
              : Colors.white;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _containerColor,
        ),
        child: Icon(
          Icons.check,
          color: _iconColor,
        ),
      ),
    );
  }
}
