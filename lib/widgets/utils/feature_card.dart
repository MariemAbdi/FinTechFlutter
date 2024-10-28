import 'package:finance_website/models/feature.dart';
import 'package:finance_website/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({Key? key, required this.feature, required this.isHovered}) : super(key: key);

  final Feature feature;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isHovered ? feature.secondaryColor : feature.primaryColor,
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Shadow color with reduced opacity
            offset: const Offset(0, 2), // Horizontal and vertical offset
            blurRadius: 4, // Softness of the shadow
            spreadRadius: 1, // How far the shadow extends
          ),
        ],
      ),
      width: Responsive.isDesktop(context) ? Responsive.screenWidth(context) / 1.2/2 - 40 : Responsive.screenWidth(context),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: isHovered ? Colors.white : feature.secondaryColor,
            child: Center(child: Image.asset(feature.icon, fit: BoxFit.scaleDown, color: isHovered ? feature.secondaryColor : Colors.white)),
          ),
          verticalSpacing,

          Text(feature.title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: isHovered ? Colors.white : null)),
          verticalSpacing,

          Text(feature.description, style: TextStyle(fontSize: 18, height: 1.3, color: isHovered ? Colors.white : null)),
          verticalSpacing,

          Container(
            width: 30, // Adjust to ensure the container is square and accommodates padding
            height: 30,
            decoration: BoxDecoration(
              color: Colors.transparent, // Transparent background
              border: Border.all(color: isHovered ? Colors.white : feature.secondaryColor, width: 1), // Black border
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: IconButton(
              icon: const Icon(Icons.north_east),
              iconSize: 20,
              color: isHovered ? Colors.white : feature.secondaryColor, // Icon color
              onPressed: (){},
              padding: EdgeInsets.zero, // Remove padding from IconButton
              constraints: const BoxConstraints(), // Remove default constraints
            ),
          )
        ],
      ),
    );
  }
}
