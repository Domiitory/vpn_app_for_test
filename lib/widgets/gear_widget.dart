import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GearWidget extends StatefulWidget {
  const GearWidget({super.key});

  @override
  State<GearWidget> createState() => _GearWidgetState();
}

class _GearWidgetState extends State<GearWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        controller.forward();
        return Transform.rotate(
          angle: rotation.value,
          child: Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/gear.png"), fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
