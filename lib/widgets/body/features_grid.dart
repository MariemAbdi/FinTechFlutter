import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/data.dart';
import '../utils/feature_card.dart';

class FeaturesGrid extends StatefulWidget {
  const FeaturesGrid({Key? key}) : super(key: key);

  @override
  State<FeaturesGrid> createState() => _FeaturesGridState();
}

class _FeaturesGridState extends State<FeaturesGrid> {
  bool isVisible = false;
  int hovered= -1;
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  void _setHovered(int isHovered) {
    setState(() {
      hovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("featuresGridVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.1 && !isVisible) {
          updateVisibility();
        }
      },
      child: FlipInX(
        animate: isVisible,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            children: [
              for(int index = 0; index<featuresList.length; index++)
                MouseRegion(
                    onEnter: (_) => _setHovered(index),
                    onExit: (_) => _setHovered(-1),
                    child: FeatureCard(feature: featuresList[index], isHovered: index == hovered)),
            ],
          ),
        ),
      ),
    );
  }
}
