import 'package:flutter/material.dart';

import '../../utils/data.dart';
import '../../utils/theme_style.dart';

class DescriptionIcon extends StatelessWidget {
  const DescriptionIcon({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(2, 2), // Slight offset to give a soft shadow
            blurRadius: 5, // Subtle blur for the grayish shadow
            spreadRadius: 1, // Subtle spread for the shadow
          ),
          const BoxShadow(
            color: CustomStyle.primaryColorLight,
            offset: Offset(-3, 0), // Shadow on the left side only
            blurRadius: 0, // No blur for the primary color shadow
            spreadRadius: 0, // No spread to ensure it stays on the left
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Icon(
            descriptionsList[index].icon,
            color: CustomStyle.primaryColorLight,
            size: 40,
          ),
        ),
      ),
    );
  }
}
