import 'package:flutter/material.dart';

class NetworkSpeedWidget extends StatelessWidget {
  const NetworkSpeedWidget(
      {super.key,
      required this.bgIcnColor,
      required this.icnColor,
      required this.icon,
      required this.tText,
      required this.sText});
  final Color bgIcnColor;
  final Color icnColor;
  final IconData icon;
  final String tText;
  final String sText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 140,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(color: bgIcnColor, shape: BoxShape.circle),
            child: Center(
              child: Icon(
                icon,
                color: icnColor,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                tText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$sText kb",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
