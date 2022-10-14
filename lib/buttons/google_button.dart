import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_2/widgets/pressable_container.dart';

class GoogleButton extends StatelessWidget {
  final Function onPress;
  final bool enabled;
  const GoogleButton({
    Key? key,
    required this.onPress,
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
          color: const Color.fromRGBO(239, 232, 255, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(FontAwesomeIcons.google, color: Color.fromRGBO(172, 160, 236, 1),),
            SizedBox(
              width: 16,
            ),
            Text(
              'Google',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
