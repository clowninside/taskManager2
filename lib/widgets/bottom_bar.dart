import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        const Icon(
          Icons.home_outlined,
          color: Colors.grey,
        ),
        const Spacer(),
        const Icon(
          Icons.fitness_center,
          color: Colors.grey,
        ),
        const Spacer(),
        const Icon(
          Icons.show_chart_rounded,
          color: Colors.grey,
        ),
        const Spacer(),
        Container(
          alignment: Alignment.center,
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(145, 88, 170, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
