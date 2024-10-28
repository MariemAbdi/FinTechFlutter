import 'package:flutter/material.dart';

class TestimonialArrow extends StatelessWidget {
  const TestimonialArrow({Key? key,required this.icon, required this.updateIndex, required this.iconColor, required this.borderColor, required this.circleColor}) : super(key: key);
  final void Function()? updateIndex;
  final IconData icon;
  final Color iconColor, borderColor, circleColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: circleColor,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 15,
        color: iconColor,
        onPressed: updateIndex,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
