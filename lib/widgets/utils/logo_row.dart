import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/utils/assets_paths.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Image.asset(
            AssetPath.logoIcon,
            width: Responsive.isMobile(context) ? 30 : 50,
            height: Responsive.isMobile(context) ? 30 : 50,
          ),
          const SizedBox(width: 10), // Space between the image and text
          const AutoSizeText(
            "Finance",
            style: TextStyle(
              fontSize: 24, // Adjust font size based on screen size
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1, // Limits text to a single line
          ),
        ],
      ),
    );
  }
}
