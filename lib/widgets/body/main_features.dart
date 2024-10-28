import 'package:finance_website/utils/constants.dart';
import 'package:finance_website/widgets/body/features_grid.dart';
import 'package:finance_website/widgets/body/features_row.dart';
import 'package:finance_website/widgets/body/statistics.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class MainFeatures extends StatefulWidget {
  const MainFeatures({Key? key}) : super(key: key);

  @override
  State<MainFeatures> createState() => _MainFeaturesState();
}

class _MainFeaturesState extends State<MainFeatures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 1.2 : 1),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: const Column(
        children: [
          FeaturesRow(),
          verticalSpacing,
          FeaturesGrid(),
          Statistics()
        ],
      ),
    );
  }
}
