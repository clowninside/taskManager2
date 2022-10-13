import 'package:flutter/material.dart';

class PressableContainer extends StatefulWidget {
  final Function onPress;
  final Widget child;

  const PressableContainer({
    Key? key,
    required this.onPress,
    required this.child,
  }) : super(key: key);

  @override
  _PressableContainerState createState() => _PressableContainerState();
}

class _PressableContainerState extends State<PressableContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => {widget.onPress()},
        onTapDown: (s) => {_controller.forward()},
        child: AnimatedBuilder(
          animation: _curvedAnimation,
          builder: (context, child) => Transform.scale(
            scale: 1.0 - (_curvedAnimation.value * 0.05),
            child: child,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
