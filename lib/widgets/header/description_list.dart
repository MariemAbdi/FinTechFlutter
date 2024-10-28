import 'package:finance_website/widgets/header/description_icon.dart';
import 'package:finance_website/widgets/header/description_title.dart';
import 'package:flutter/material.dart';

import '../../utils/data.dart';
import '../../utils/responsive.dart';

class DescriptionList extends StatelessWidget {
  const DescriptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: descriptionsList.length,
      padding: const EdgeInsets.only(top: 50),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Responsive.isMobile(context)
              ? Column(
            children: [
              // Icon with Shadow in a Row
              FractionallySizedBox(
                widthFactor: 0.3, // Adjust size for mobile devices
                child: DescriptionIcon(index: index),
              ),
              const SizedBox(height: 10), // Space between the icon and the text
              // Text below the icon for mobile layout
              DescriptionTitle(index: index)
            ],
          )
              : Row(
            children: [
              // Icon with Shadow in a Row
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: Responsive.isDesktop(context) ? 0.6 : 0.4,
                  child: DescriptionIcon(index: index),
                ),
              ),
              const SizedBox(width: 10), // Add space between the icon and text
              Expanded(
                flex: 4,
                child: DescriptionTitle(index: index),
              )
            ],
          ),
        );
      },
    );
  }
}
