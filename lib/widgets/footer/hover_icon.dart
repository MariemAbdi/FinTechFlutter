import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HoverIcon extends StatefulWidget {
  final IconData icon;
  final Color hoverColor;

  const HoverIcon({
    Key? key,
    required this.icon,
    this.hoverColor = Colors.blue,
  }) : super(key: key);

  @override
  HoverIconState createState() => HoverIconState();
}

class HoverIconState extends State<HoverIcon> {
  late Color iconColor = Colors.grey.withOpacity(0.6);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
        border: Border.all(color: iconColor, width: 1), // Border color
        borderRadius: BorderRadius.circular(100), // Rounded corners
      ),
      child: Center(
        child: MouseRegion(
          onEnter: (_) => setState(() {
            iconColor = widget.hoverColor; // Change color on hover
          }),
          onExit: (_) => setState(() {
            iconColor = Colors.grey.withOpacity(0.6); // Revert color on hover exit
          }),
          child: IconButton(
            icon: FaIcon(widget.icon),
            iconSize: 15,
            color: iconColor, // Dynamic icon color
            onPressed: () {},
            padding: EdgeInsets.zero, // Remove padding from IconButton
            constraints: const BoxConstraints(), // Remove default constraints
          ),
        ),
      ),
    );
  }
}
